class OrdersController < ApplicationController
  include OrdersHelper
  include SmsHelper

  # My order
  def my
    # check login status
    user_id = current_user.id
    @user = User.where("id = #{user_id}")[0]
    @my_trucks = Foodtruck.where("user_id = #{user_id}")
    if @my_trucks.nil?
      @my_trucks = []
    end

    @orders = get_all_my_orders(@my_trucks, user_id)
    logger.info "Find #{@orders.length} orders"
  end

  # Order detail
  def detail
    order_no = params[:order_no]
    logger.info "Querying detail for order [#{order_no}]"

    @order = Order.find_by_order_no order_no
    if @order.nil?
      logger.info "There is no order with order number [#{order_no}]."
      return
    end

    @items = OrderItem.where "order_no = '#{order_no}'"
    if @items.nil? || @items.empty?
      logger.info "There is no item in order [#{order_no}]."
      raise Exception "Invalid order [#{order_no}]"
    end
  end

  # Checkout
  def checkout
    logger.info 'Run here in checkout'
    @truck_info = session[:foodtruck]
    # logger.info "@truck_info: #{@truck_info}"
    @item_list = session[:items].values
    # logger.info "session items: #{session["items"]}"
    @order_subtotal = 0
  end

  # Place order
  def place
    logger.info 'Run here in place order'
    logger.info "API Params: #{params}"
    @truck = params[:truck]
    @item_list = params[:items]
    @user_id = current_user.id
    @order_subtotal = params[:subtotal].to_f

    # generate order no
    order_no = generate_order_no
    logger.info "New order no generated: #{order_no}"

    # transactional place the order
    ActiveRecord::Base.transaction do
      # 1. create order
      new_order = {}
      new_order[:order_no] = order_no
      new_order[:truck_id] = @truck[:truck_id]
      new_order[:truck_name] = @truck[:truck_name]
      new_order[:truck_img] = @truck[:truck_img]
      new_order[:order_subtotal] = @order_subtotal
      new_order[:order_status] = 2
      new_order[:user_id] = @user_id
      # replace the order object with the result of db insertion to get id
      new_order = Order.create(new_order)

      # 2. get id after saving to the db
      new_order_id = new_order[:id]
      logger.info "New order created: #{new_order_id}"

      # 3. create each items
      @item_list.each_with_index do |item, index|
        new_item = {}
        new_item[:order_id] = new_order_id
        new_item[:order_no] = order_no
        new_item[:item_id] = item[:item_id].to_i
        new_item[:item_name] = item[:item_name]
        new_item[:item_price] = item[:item_price].to_f
        new_item[:quantity] = item[:quantity].to_i
        new_item[:img_url] = item[:item_img]
        OrderItem.create(new_item)
        logger.info "Item #{index + 1} created for order #{order_no}"
      end
    end

    logger.info "Create order #{order_no} completed!"

    redirect_to '/orders/my'
  end

  # update order status
  def update_status
    order_no = params['order_no']
    current_status = params['status'].to_i

    need_notify, next_status = get_next_status current_status

    logger.info "order_no: #{order_no}, current_status: #{current_status}, next_status: #{next_status}"

    # check whether the order to update exists
    origin_order = Order.find_by_order_no(order_no)
    if origin_order.nil?
      logger.error "Fail to update order [#{order_no}] status, order does not exist!"
      raise Exception "Invalid order"
    end

    # transactional operation
    ActiveRecord::Base.transaction do
      # 1. Update the order status
      origin_order.order_status = next_status
      origin_order.updated_at = Time.new
      origin_order.save

      # 2. add a new update record
      new_update_record = {}
      new_update_record[:order_id] = origin_order.id
      new_update_record[:order_no] = origin_order.order_no
      new_update_record[:before_update_status_code] = current_status
      new_update_record[:before_update_status] = transform_order_status current_status
      new_update_record[:after_update_status_code] = next_status
      new_update_record[:after_update_status] = transform_order_status next_status
      new_update_record[:operator_id] = current_user.id
      new_update_record[:operator_name] = "#{current_user.first_name} #{current_user.last_name}"
      OrderUpdateRecord.create(new_update_record)
    end

    # Notify the user by SMS
    if need_notify
      user_id = origin_order.user_id
      user = User.where("id = #{user_id}")[0]
      if user.nil?
        logger.error "No user with user id #{user_id}"
        raise Exception 'Fail to send message, no such user!'
      end

      truck_id = origin_order.truck_id
      truck = Foodtruck.where("id = #{truck_id}")[0]
      if truck.nil?
        logger.error "No user truck user id #{user_id}"
        raise Exception 'Fail to send message, no such food truck!'
      end

      # logger.info "Truck #{truck.as_json}"
      # logger.info "User #{user.as_json}"

      truck_name = truck.Name
      address = truck.Address
      username = user.first_name
      status = transform_order_status next_status
      message = build_message_body(username, truck_name, status, address)

      user_mobile = user.phone
      send_message(user_mobile, message)
    end

    # reload the page
    redirect_to '/orders/my'
  end

end
