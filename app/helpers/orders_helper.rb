require 'securerandom'

module OrdersHelper
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

  def self.generate_order_no
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
    order_user_id = order.user_id
    if user_id == order_user_id && order_status == 3
      return 'COMPLETE this order'
    end

    ''
  end

end
