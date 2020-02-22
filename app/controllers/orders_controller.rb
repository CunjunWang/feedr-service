class OrdersController < ApplicationController

  def my
    @orders = Order.where('user_id = 1')
    logger.info "Find #{@orders.length} orders"

    @orders.each do |o|
      logger.info "order subtotal: #{o.order_subtotal}"
    end
  end

end
