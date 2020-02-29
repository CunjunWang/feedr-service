Given(/^There are following orders$/) do |order_table|
  order_table.hashes.each_with_index do |order, index|
    Order.new(order).save
  end
end

Given(/^There are following order items$/) do |order_item_table|
  order_item_table.hashes.each_with_index do |item, index|
    OrderItem.new(item).save
  end
end