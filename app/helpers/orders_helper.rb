require 'securerandom'

module OrdersHelper

  def get_all_my_orders(my_trucks, user_id)
    my_orders = []
    # the orders that I placed
    my_placed_order = Order.where("user_id = #{user_id}")
    if !my_placed_order.nil? && !my_placed_order.empty?
      my_orders.concat(my_placed_order)
    end

    # the orders that placed to my truck
    if !my_trucks.nil? && !my_trucks.empty?
      my_trucks.each do |truck|
        my_truck_order = Order.where("truck_id = #{truck.id}")
        if !my_truck_order.nil? && !my_truck_order.empty?
          my_orders.concat(my_truck_order)
        end
      end
    end

    my_orders
  end

  def transform_order_status(order_status_code)
    if order_status_code == 1
      'NOT PAID'
    elsif order_status_code == 2
      'PREPARING'
    elsif order_status_code == 3
      'READY'
    elsif order_status_code == 4
      'FINISHED'
    else
      'CANCELED'
    end
  end

  def calculate_item_subtotal(price, quantity)
    res = price * quantity
    @order_subtotal += res
    res
  end

  def generate_order_no
    order_no = SecureRandom.uuid
    order_no.gsub('-', '')
  end

  def get_update_order_link_text(order, my_trucks)
    user_id = current_user.id
    order_truck_id = order.truck_id
    order_status = order.order_status

    # check if the order belong to my truck
    if !my_trucks.nil? && !my_trucks.empty?
      my_trucks.each do |truck|
        truck_id = truck.id
        logger.info "Truck id = #{truck_id}"
        logger.info "Order Truck Id = #{order_truck_id}"
        if truck_id.to_i == order_truck_id.to_i
          logger.info "Current order status = #{order_status}"
          if order_status == 2
            return 'Notify the user order is READY!'
          end
          if order_status == 3
            return 'COMPLETE this order'
          end
        end
      end
    end

    # check if the order is placed by me
    order_user_id = order.user_id.to_i
    logger.info "user_id class: #{user_id.class}"
    logger.info "order_user_id class: #{order_user_id.class}"
    logger.info "order_status class: #{order_status.class}"
    logger.info "user_id: #{user_id}, order_user_id: #{order_user_id}, order_status: #{order_status}"
    if user_id == order_user_id && order_status == 3
      return 'COMPLETE this order'
    end

    ''
  end

  def get_next_status(current_status)
    need_notify = false
    if current_status == 2
      next_status = 3
      need_notify = true
    elsif current_status == 3
      next_status = 4
    else
      next_status = 5
    end

    [need_notify, next_status]
  end

end
