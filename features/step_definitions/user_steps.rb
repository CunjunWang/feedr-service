Given(/^An existing user is using "([^"]*)"$/) do |email|
  @user = User.new({email: email, password: 'ljf111111', first_name: 'Jason', last_name: 'Lee', phone: '6463870372'})
  @user.save
end

Given(/^there is an existing user with email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  @user = User.new({email: email, password: password, first_name: 'Jason', last_name: 'Lee', phone: '6463870372'})
  @user.save
end

Given(/^There are following orders$/) do |order_table|
  # table is a table.hashes.keys # => [:order_no, :truck_id, :user_id, :order_status, :order_subtotal, :is_del, :truck_name]
  order_table.hashes.each_with_index do |order, index|
    Order.new(order).save
  end
end

Given(/^There are following users$/) do |user_table|
  # table is a table.hashes.keys # => [:email, :password, :first_name, :last_name, :phone]
  user_table.hashes.each_with_index do |user, index|
    User.new(user).save
  end
end