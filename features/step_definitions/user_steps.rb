Given(/^An existing user is using "([^"]*)"$/) do |email|
  @user = User.new({email: email, password: 'ljf111111', first_name: 'Jason', last_name: 'Lee', phone: '6463870372'})
  @user.save
end

Given(/^there is an existing user with email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  @user = User.new({email: email, password: password, first_name: 'Jason', last_name: 'Lee', phone: '6463870372'})
  @user.save
end

Given(/^There are following users$/) do |user_table|
  # table is a table.hashes.keys # => [:email, :password, :first_name, :last_name, :phone]
  user_table.hashes.each_with_index do |user, index|
    @user = User.new(user)
    @user.save
  end
end

When(/^I am on users\/new$/) do
  visit '/users/new'
end

When(/^I am on login$/) do
  visit '/login'
end

When(/^I am on homepage$/) do
  visit '/'
end