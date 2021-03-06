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

Then /^I should find "([1-9]+)" history of order "([^"]*)" in database$/ do |num_of_record, order_no|
  num = OrderUpdateRecord.where("order_no = '#{order_no}'").length
  assert num_of_record.to_i == num
end

Then /^The order "([^"]*)" status should be "([^"]*)"$/ do |order_no, order_status|
  order = Order.where("order_no = '#{order_no}'")[0]
  # puts order.to_json
  status = order.order_status.to_i
  assert status == order_status.to_i
end

When /^I add item ([1-9]+) to cart$/ do |item_number|
  # puts "item number: #{item_number}"
  page.all('tr').each_with_index do |tr, index|
    # puts "index = #{index}"
    if index.to_i == item_number.to_i
      link = tr.find(:css, '.btn-secondary')[:href]
      visit link
    end
  end
end

When /^I delete item ([1-9]+) from cart$/ do |item_number|
  page.all('tr').each_with_index do |tr, index|
    if index.to_i == item_number.to_i
      link = tr.find(:css, '.btn-secondary')[:href]
      visit link
    end
  end
end