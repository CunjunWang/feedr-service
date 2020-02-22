class OrdersController < ApplicationController

  # My order
  def my
    # check login status
    user_id = current_user.id
    @orders = Order.where("user_id = #{user_id}")
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
    @user = current_user
    @truck_info = {truck_name: 'Test Truck 1', truck_id: 1, truck_img: ''}
    @item_list = [
        {item_id: 1, item_name: 'Fried Eggplant', item_price: 9.50, quantity: 2, item_img: ''},
        {item_id: 6, item_name: 'Iced Hazelnut Coffee', item_price: 2.32, quantity: 1, item_img: ''}
    ]
    @truck_info = session[:foodtruck] if session[:foodtruck]
    @item_list = session[:items] if session[:items]
    @order_subtotal = 0
  end

  # Place order
  def place
    logger.info 'Run here in place order'
    logger.info "API Params: #{params}"
    @truck = params[:truck]
    @item_list = params[:items]
    @user_id = params[:user].to_i
    @order_subtotal = params[:subtotal].to_f

    # generate order no
    order_no = OrdersHelper.generate_order_no
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

end
