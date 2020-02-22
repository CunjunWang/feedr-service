# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Order seed data
orders = [
    {order_no: 'test_order_1', truck_id: 1, user_id: 1, order_subtotal: 19.00, order_status: 2},
    {order_no: 'test_order_2', truck_id: 1, user_id: 2, order_subtotal: 25.50, order_status: 2},
    {order_no: 'test_order_3', truck_id: 2, user_id: 1, order_subtotal: 6.52, order_status: 2},
    {order_no: 'test_order_4', truck_id: 2, user_id: 2, order_subtotal: 30.49, order_status: 2},
    {order_no: 'test_order_5', truck_id: 3, user_id: 3, order_subtotal: 15.93, order_status: 2},
    {order_no: 'test_order_6', truck_id: 1, user_id: 4, order_subtotal: 10.22, order_status: 2}
]

orders.each do |order|
  Order.create!(order)
end

# Order Item seed data
order_items = [
    {order_id: 1, order_no: 'test_order_1', item_id: 1, item_name: 'Fried Eggplant', item_price: 9.50, quantity: 2},
    {order_id: 2, order_no: 'test_order_2', item_id: 2, item_name: 'Garlic Pork', item_price: 12.00, quantity: 1},
    {order_id: 2, order_no: 'test_order_2', item_id: 3, item_name: 'Dry Pot Cabbage', item_price: 11.50, quantity: 1},
    {order_id: 2, order_no: 'test_order_2', item_id: 4, item_name: 'White Rice', item_price: 1.00, quantity: 2},
    {order_id: 3, order_no: 'test_order_3', item_id: 5, item_name: 'Sausage McBiscuit', item_price: 4.20, quantity: 1},
    {order_id: 3, order_no: 'test_order_3', item_id: 6, item_name: 'Iced Hazelnut Coffee', item_price: 2.32, quantity: 1},
    {order_id: 4, order_no: 'test_order_4', item_id: 6, item_name: 'Iced Hazelnut Coffee', item_price: 2.32, quantity: 1},
    {order_id: 4, order_no: 'test_order_4', item_id: 7, item_name: 'BigMc Combo', item_price: 15.88, quantity: 1},
    {order_id: 4, order_no: 'test_order_4', item_id: 8, item_name: '20 Piece of McNugget', item_price: 12.29, quantity: 1},
    {order_id: 5, order_no: 'test_order_5', item_id: 9, item_name: 'Stewed Pork Burger', item_price: 5.31, quantity: 3},
    {order_id: 6, order_no: 'test_order_6', item_id: 4, item_name: 'White Rice', item_price: 1.00, quantity: 2},
    {order_id: 6, order_no: 'test_order_6', item_id: 10, item_name: 'Mouth Pouring Chicken', item_price: 8.22, quantity: 1},
]

order_items.each do |item|
  OrderItem.create!(item)
end
