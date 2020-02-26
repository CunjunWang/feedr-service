Given(/^An existing user is using "([^"]*)"$/) do |email|
  @user = User.new({email: email, password: 'ljf111111', first_name: 'Jason', last_name: 'Lee', phone: '6463870372'})
  @user.save
end

Given(/^there is an existing user with email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  @user = User.new({email: email, password: password, first_name: 'Jason', last_name: 'Lee', phone: '6463870372'})
  @user.save
end