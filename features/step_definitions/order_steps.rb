require "rack_session_access/capybara"

# page.set_rack_session to set your desired session data
# page.get_rack_session to obtain your application session data
# page.get_rack_session_key to obtain certain key of your application session data

Given /the following items in session/ do |items_table|
  items = {}
  items_table.hashes.each_with_index do |item, index|
    # puts "index: #{index}; item: #{item}"
    items[(index + 1).to_s] = item
  end
  puts "Items: #{items.inspect}"
  page.set_rack_session(items: items.inspect)
end

Then /^(\d?[1-9]|[1-9]0) items should exist/ do |num|
  vals = page.get_rack_session('items').values
  count = 0
  vals.each do |val|
    count += val['quantity'].to_i
  end
  expect(count).to eq num
end
