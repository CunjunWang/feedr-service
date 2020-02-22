class OrdersController < ApplicationController

  def my
    # check login status
    # unless logged_in?
    #   redirect_to '/login'
    #   return
    # end
    # user_id = session[:user_id]
    user_id = 2
    @orders = Order.where("user_id = #{user_id}")
    logger.info "Find #{@orders.length} orders"
  end

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


end
