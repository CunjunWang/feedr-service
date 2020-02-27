Given(/^There are following foodtrucks$/) do |foodtrucks_table|
  # table is a table.hashes.keys # => [:Name, :Type, :Address, :Description, :Owner]
  foodtrucks_table.hashes.each_with_index do |foodtruck, index|
    @foodtruck = Foodtruck.new(foodtruck)
    @foodtruck.save
  end
end