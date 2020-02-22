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

    @items = {}
    @orders.each do |o|
      order_no = o.order_no
      item_arr = OrderItem.where("order_no = '#{order_no}'")
      logger.info("item length = #{item_arr.length}")
      @items[order_no] = item_arr
    end
  end

  def detail

  end

end
