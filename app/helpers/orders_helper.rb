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

end
