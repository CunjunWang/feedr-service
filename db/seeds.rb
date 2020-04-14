# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Order seed data
# orders = [
#     {order_no: 'test_order_1', truck_id: 1, user_id: 1, order_subtotal: 19.00, order_status: 2},
#     {order_no: 'test_order_2', truck_id: 1, user_id: 2, order_subtotal: 25.50, order_status: 2},
#     {order_no: 'test_order_3', truck_id: 2, user_id: 1, order_subtotal: 6.52, order_status: 2},
#     {order_no: 'test_order_4', truck_id: 2, user_id: 2, order_subtotal: 30.49, order_status: 2},
#     {order_no: 'test_order_5', truck_id: 3, user_id: 3, order_subtotal: 15.93, order_status: 2},
#     {order_no: 'test_order_6', truck_id: 1, user_id: 4, order_subtotal: 10.22, order_status: 2}
# ]
#
# orders.each do |order|
#   Order.create!(order)
# end
#
# # Order Item seed data
# order_items = [
#     {order_id: 1, order_no: 'test_order_1', item_id: 1, item_name: 'Fried Eggplant', item_price: 9.50, quantity: 2},
#     {order_id: 2, order_no: 'test_order_2', item_id: 2, item_name: 'Garlic Pork', item_price: 12.00, quantity: 1},
#     {order_id: 2, order_no: 'test_order_2', item_id: 3, item_name: 'Dry Pot Cabbage', item_price: 11.50, quantity: 1},
#     {order_id: 2, order_no: 'test_order_2', item_id: 4, item_name: 'White Rice', item_price: 1.00, quantity: 2},
#     {order_id: 3, order_no: 'test_order_3', item_id: 5, item_name: 'Sausage McBiscuit', item_price: 4.20, quantity: 1},
#     {order_id: 3, order_no: 'test_order_3', item_id: 6, item_name: 'Iced Hazelnut Coffee', item_price: 2.32, quantity: 1},
#     {order_id: 4, order_no: 'test_order_4', item_id: 6, item_name: 'Iced Hazelnut Coffee', item_price: 2.32, quantity: 1},
#     {order_id: 4, order_no: 'test_order_4', item_id: 7, item_name: 'BigMc Combo', item_price: 15.88, quantity: 1},
#     {order_id: 4, order_no: 'test_order_4', item_id: 8, item_name: '20 Piece of McNugget', item_price: 12.29, quantity: 1},
#     {order_id: 5, order_no: 'test_order_5', item_id: 9, item_name: 'Stewed Pork Burger', item_price: 5.31, quantity: 3},
#     {order_id: 6, order_no: 'test_order_6', item_id: 4, item_name: 'White Rice', item_price: 1.00, quantity: 2},
#     {order_id: 6, order_no: 'test_order_6', item_id: 10, item_name: 'Mouth Pouring Chicken', item_price: 8.22, quantity: 1},
# ]
#
# order_items.each do |item|
#   OrderItem.create!(item)
# end


# Food truck seed data
trucks = [
    {Name: 'Starbucks', Type: 'American', Address: '114th St & Broadway', Description: 'World famous coffee chain store', Owner: 'Cunjun', user_id: '1'},
    {Name: 'McDonald\'s', Type: 'American', Address: '2726 Broadway, NEW YORK, NY', Description: 'I\'d love it!', Owner: 'Jierui', user_id: '2'},
    {Name: 'Popeyes', Type: 'American', Address: '53 W 116th St, New York, NY', Description: 'Do you love fried chicken?', Owner: 'Jiefan', user_id: '3'},
    {Name: 'Junzi Kitchen', Type: 'Chinese', Address: '2896 Broadway, New York, NY', Description: 'Morningside Heights store', Owner: 'Cunjun', user_id: '1'},
    {Name: 'Happy Hot Hunan 御湘园', Type: 'Chinese', Address: '969 Amsterdam Ave, New York, NY', Description: 'Best Hunan food near Columbia University', Owner: 'Jierui', user_id: '2'},
    {Name: 'Atlas Kitchen 山海', Type: 'Chinese', Address: '258 W 109th St, New York, Ny', Description: 'Delicious elegant Chinese food near UWS', Owner: 'Jiefan', user_id: '3'},
    {Name: 'Mokja', Type: 'Korean', Address: '852 Amsterdam Ave, New York', Description: 'Your special korean chef', Owner: 'Cunjun', user_id: '1'},
    {Name: 'Naruto Ramen', Type: 'Japanese', Address: '2634 Broadway, New York, NY', Description: 'Enjoy your Ramen', Owner: 'Jierui', user_id: '2'},
    {Name: 'Koko Wings', Type: 'Korean', Address: '248 W 106th St, New York, Ny', Description: 'Wing Wins', Owner: 'Jiefan', user_id: '3'},
    {Name: 'Spice', Type: 'Mongolian', Address: '1479 1st Ave, New York, NY', Description: 'Spicy Spice', Owner: 'Cunjun', user_id: '1'}
]

trucks.each do |truck|
  Foodtruck.create!(truck)
end

# Menu item seed data
menu_items = [
    {Name: 'Caffè Americano', Description: 'Espresso shots topped with hot water create a light layer of cream culminating in this wonderfully rich cup with depth and nuance. Pro Tip: For an additional boost, ask your barista to try this with an extra shot.', price: 2.85, foodtruck_id: 1},
    {Name: 'Iced Caramel Macchiato', Description: 'We combine our rich, full-bodied espresso with vanilla-flavored syrup, milk and ice, then top it off with a caramel drizzle for an oh-so-sweet finish.', price: 5.35, foodtruck_id: 1},
    {Name: 'Pink Drink', Description: 'Our crisp, Strawberry Açaí Refreshers® Beverage, with its accents of passion fruit, is combined with creamy coconutmilk. A fruity and refreshing sip of spring, no matter what time of year.', price: 5.25, foodtruck_id: 1},
    {Name: 'Lemonade', Description: 'Awaken your taste buds with the zing of refreshing lemonade—this tangy, fresh sip puts a little zip in your step.', price: 2.65, foodtruck_id: 1},
    {Name: 'Bacon, Gouda & Egg Sandwich', Description: 'Sizzling applewood-smoked bacon, melty aged Gouda and a Parmesan frittata layered on an artisan roll for extra-smoky breakfast goodness.', price: 4.95, foodtruck_id: 1},
    {Name: 'Double-Smoked Bacon, Cheddar & Egg Sandwich', Description: 'Bacon smoked for six hours over hickory wood chips, stacked with a fluffy egg patty, topped with a creamy melted slice of sharp Cheddar, double-smoked delciously to fill you up—all on our signature croissant bun.', price: 5.95, foodtruck_id: 1},
    {Name: 'Little Mac', Description: '320 Cal', price: 4.55, foodtruck_id: 2},
    {Name: 'Medium French Fries', Description: '320 Cal', price: 3.44, foodtruck_id: 2},
    {Name: 'Buttermilk Chicken-Crispy', Description: '600 Cal', price: 6.77, foodtruck_id: 2},
    {Name: '40 McNuggets', Description: '1660 Cal', price: 11.49, foodtruck_id: 2},
    {Name: 'Bottle Diet Coke', Description: '2,000 calories a day is used for general nutrition advice, but calorie needs vary. Additional nutrition information available upon request.', price: 2.3, foodtruck_id: 2},
    {Name: 'Spicy Chicken Sandwich Combo', Description: 'Includes a choice of regular signature side and a drink.', price: 8.99, foodtruck_id: 3},
    {Name: 'Mixed Chicken (8 Pcs)', Description: 'Includes one large signature side and four hot buttermilk biscuits.', price: 25.29, foodtruck_id: 3},
    {Name: 'Butterfly Shrimp Tackle Box Combo (8 Pcs)', Description: 'Includes a choice of regular signature side, a biscuit and a drink.', price: 8.39, foodtruck_id: 3},
    {Name: 'custom rice bowl', Description: 'customize your own rice bowl starting with a base of millet rice, and top it off with your choice of protein, seasonal vegetables and garnishes', price: 10.49, foodtruck_id: 4},
    {Name: 'custom bing wrap', Description: 'northern Chinese wrap with choice of main item, vegetables, garnish and sauce', price: 6.99, foodtruck_id: 4},
    {Name: 'arctic ocean 北冰洋汽水', Description: 'soda, 12.6 fl oz', price: 3.99, foodtruck_id: 4},
    {Name: 'Hunan BBQ Fish 湖南烤全鱼', Description: 'Spicy', price: 28.55, foodtruck_id: 5},
    {Name: 'Minced Pork w. Pickled Bean and Jelly Noodle 酸豆角肉末粉皮', Description: 'Spicy', price: 16.55, foodtruck_id: 5},
    {Name: 'Braised Free Range Chicken with Ginger 老姜土鸡', Description: 'Non-Spicy', price: 32.95, foodtruck_id: 5},
    {Name: 'Crispy Pork Intestine 干煸肥肠', Description: 'Spicy', price: 19.95, foodtruck_id: 5},
    {Name: 'Kidney with Pickled Vegetable 酸辣腰花', Description: 'Spicy', price: 15.95, foodtruck_id: 5},
    {Name: 'House Special Smoked Pork Fried Rice 腊味炒饭', Description: 'Rice', price: 10.55, foodtruck_id: 5},
    {Name: 'Steamed Rice 白饭', Description: 'Large', price: 2.5, foodtruck_id: 5},
    {Name: 'Crispy Pork in Sweet & Sour Sauce 锅包肉', Description: 'Non-Spicy', price: 16.96, foodtruck_id: 6},
    {Name: 'Chicken Feet with Two Spices 双味九凤爪', Description: 'Spicy', price: 9.95, foodtruck_id: 6},
    {Name: 'Baby Cabbage with Ham Broth 金汤娃娃菜', Description: 'Vegan', price: 16.95, foodtruck_id: 6},
    {Name: 'Sautéed Fresh Chicken with Aged Ginger 茶油老姜烧鸡', Description: 'Non-spicy', price: 33.95, foodtruck_id: 6},
    {Name: 'Steamed Whole Fish (Tilapia) with Green Pepper 青椒蒸全鱼', Description: 'Mild', price: 28.95, foodtruck_id: 6},
    {Name: 'Spicy Pig Feet 北鲜开边猪脚', Description: 'Non-spicy', price: 19.95, foodtruck_id: 6},
    {Name: 'Korean Fried Chicken', Description: 'Sweet and sour', price: 8.95, foodtruck_id: 7},
    {Name: 'Spicy Tuna Kimbap', Description: 'Spicy cooked tuna, carrots, and daikon radish.', price: 8.55, foodtruck_id: 7},
    {Name: 'Korean Spicy Ramen', Description: 'Noodles with vegetables and egg in spicy beef broth. Choice of meat topping.', price: 9.95, foodtruck_id: 7},
    {Name: 'Mega Naruto Ramen', Description: 'Soy sauce based noodle soup with bean sprouts, bamboo shoot, fish cake, stir-fried vegetable, egg, scallion, minced pork, and roasted pork or chicken breast.', price: 16, foodtruck_id: 8},
    {Name: 'Veggie Ramen (Shoyu)', Description: 'Kale, cauliflower, bok choy, tofu, scallion, paprika, and corn. Vegetable noodle soup (shoyu taste).', price: 14, foodtruck_id: 8},
    {Name: 'Pork Fried Rice', Description: 'Large', price: 6, foodtruck_id: 8},
    {Name: 'Kara Age Naruto Fried Chicken', Description: 'non-spicy', price: 8.95, foodtruck_id: 8},
    {Name: 'Wings', Description: 'Korean fried chicken crispy, juicy, and minimally greasy.', price: 13.95, foodtruck_id: 9},
    {Name: 'Drumsticks', Description: 'Korean fried chicken crispy, juicy, and minimally greasy.', price: 15.95, foodtruck_id: 9},
    {Name: 'Japchae', Description: 'Stir fried sweet potato noodles with vegetables, mushroom, and bulgogi beef based on soy sauce. Sesame seed on top.', price: 19.95, foodtruck_id: 9},
    {Name: 'Pad Thai', Description: 'With rice noodles, egg, radish, peanut, bean sprouts, and scallion.', price: 14, foodtruck_id: 10},
]

menu_items.each do |item|
  Menuitem.create!(item)
end