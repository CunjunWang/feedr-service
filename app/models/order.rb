class Order < ActiveRecord::Base
  def order_detail_path(order_no)
    "/orders/detail/#{order_no}"
  end
end
