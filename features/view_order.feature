Feature: View My Orders
  After login, the user can view the profile, and then view his orders.

  Background:
    Given There are following users
      | id | email               | password | first_name | last_name | phone       |
      | 1  | mickey@monkees.com  | password | Jason      | Lee       | 6463870372  |
      | 2  | 1@qq.com            | password | Jaye       | Lee       | 64618733172 |
      | 3  | duckwcj@gmail.com   | 123456   | Cunjun     | Wang      | 6466413916  |
      | 4  | cw3199@columbia.wdu | 123456   | 3199       | cw        | 6047830732  |
    Given There are following foodtrucks
      | id | Name           | Type     | Address               | Description            | Owner     | user_id |
      | 1  | Luoyang Uncle  | Chinese  | 354 Cathedral Parkway | Delicious Chinese Food | Jiefan Li | 1       |
      | 2  | Hamburger King | American | 2060 Broadway         | Great hamburgers       | Tom       | 2       |
    Given There are following orders
      | id | order_no     | truck_id | truck_name     | user_id | order_subtotal | order_status |
      | 1  | test_order_1 | 1        | Luoyang Uncle  | 2       | 19.00          | 2            |
      | 2  | test_order_2 | 1        | Luoyang Uncle  | 2       | 25.50          | 2            |
      | 3  | test_order_3 | 2        | Hamburger King | 1       | 6.52           | 2            |
      | 4  | test_order_4 | 2        | Hamburger King | 3       | 30.49          | 2            |
      | 5  | test_order_5 | 2        | Hamburger King | 3       | 15.93          | 2            |
      | 6  | test_order_6 | 1        | Luoyang Uncle  | 4       | 10.22          | 2            |
    Given There are following order items
      | order_id | order_no     | item_id | item_name             | item_price | quantity |
      | 1        | test_order_1 | 1       | Fried Eggplant        | 9.50       | 2        |
      | 2        | test_order_2 | 2       | Garlic Pork           | 12.0       | 1        |
      | 2        | test_order_2 | 3       | Dry Pot Cabbage       | 11.5       | 1        |
      | 2        | test_order_2 | 4       | White Rice            | 1.0        | 2        |
      | 3        | test_order_3 | 5       | Sausage McBiscuit     | 4.20       | 1        |
      | 3        | test_order_3 | 6       | Iced Hazelnut Coffee  | 2.32       | 1        |
      | 4        | test_order_4 | 6       | Iced Hazelnut Coffee  | 2.32       | 1        |
      | 4        | test_order_4 | 7       | BigMc Combo           | 15.88      | 1        |
      | 4        | test_order_4 | 8       | 20 Piece of McNugget  | 12.29      | 1        |
      | 5        | test_order_5 | 9       | Stewed Pork Burger    | 5.31       | 3        |
      | 6        | test_order_6 | 4       | White Rice            | 1.0        | 2        |
      | 6        | test_order_6 | 10      | Mouth Pouring Chicken | 8.22       | 1        |

  Scenario: Can see the number of orders I have on personal profile page
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I press "Login"
    When I follow "Jason Lee"
    Then I should be on /users/show
    And I should see "Show All 4 Orders"

  Scenario: Can see the list of orders on the order list page
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I press "Login"
    When I follow "Jason Lee"
    And I follow "Show All 4 Orders"
    Then I should be on /orders/my
    Then I should see "Order no: test_order_1"
    And I should see "Order Status: PREPARING"
    And I should see "Order Subtotal: $ 19"
    And I should see "Order no: test_order_2"
    And I should see "Order no: test_order_3"
    And I should not see "Order no: test_order_4"

  Scenario: Can see the details of an order when I click on an order
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I press "Login"
    When I follow "Jason Lee"
    And I follow "Show All 4 Orders"
    Then I should be on /orders/my
    Then I should see "Order no: test_order_1"
    When I follow "Order no: test_order_1"
    Then I should be on /orders/detail/test_order_1
    Then I should see "Truck: Luoyang Uncle"
    And I should see "Order no: test_order_1"
    And I should see "Order status: PREPARING"
    And I should see "Item Number: 1"
    And I should see "Item Name: Fried Eggplant"
    And I should see "Item Price: $ 9.5"
    And I should see "Quantity: 2"
    When I follow "Back"
    Then I should be on /orders/my