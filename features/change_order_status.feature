Feature: Change Order Status
  If the order is placed to my truck, I can change the order

  Background:
    Given There are following users
      | id | email               | password | first_name | last_name | phone       |
      | 1  | mickey@monkees.com  | password | Jason      | Lee       | 6463870372  |
      | 2  | cw3199@columbia.wdu | 123456   | 3199       | cw        | 6047830732  |
      | 3  | duckwcj@gmail.com   | 123456   | Cunjun     | Wang      | 6466413916  |
      | 4  | 1@qq.com            | password | Jaye       | Lee       | 64618733172 |
    Given There are following foodtrucks
      | id | Name           | Type     | Address               | Description            | Owner     | user_id |
      | 1  | Luoyang Uncle  | Chinese  | 354 Cathedral Parkway | Delicious Chinese Food | Jiefan Li | 1       |
      | 2  | Hamburger King | American | 2060 Broadway         | Great hamburgers       | Tom       | 2       |
    Given There are following orders
      | id | order_no     | truck_id | truck_name     | user_id | order_subtotal | order_status |
      | 1  | test_order_1 | 1        | Luoyang Uncle  | 3       | 19.00          | 2            |
      | 2  | test_order_2 | 1        | Luoyang Uncle  | 2       | 25.50          | 4            |
      | 3  | test_order_3 | 2        | Hamburger King | 1       | 6.52           | 2            |
      | 4  | test_order_4 | 2        | Hamburger King | 2       | 30.49          | 2            |
      | 5  | test_order_5 | 2        | Hamburger King | 2       | 15.93          | 2            |
      | 6  | test_order_6 | 1        | Luoyang Uncle  | 4       | 10.22          | 4            |
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

  Scenario: Can see the link to change status of order
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
    And I should see "Notify the user order is READY!"
    And I should see "Order no: test_order_2"
    And I should see "Order Status: FINISHED"
    And I should see "Order Subtotal: $ 25.5"
    And I should see "Order no: test_order_3"
    And I should see "Order Status: PREPARING"
    And I should see "Order Subtotal: $ 6.52"
    And I should see "Notify the user order is READY!"
    And I should see "Order no: test_order_6"
    And I should see "Order Status: FINISHED"
    And I should see "Order Subtotal: $ 10.22"

  Scenario: Can click the link to change status of order and see a new history in database
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I press "Login"
    When I follow "Jason Lee"
    And I follow "Show All 4 Orders"
    Then I should be on /orders/my
    # the truck owner change the order status from PREPARING to READY
    Then I should see "Order no: test_order_1"
    And I should see "Order Status: PREPARING"
    And I should see "Notify the user order is READY!"
    Then I follow "Notify the user order is READY!"
    Then I should see "Order Status: READY"
    And I should see "COMPLETE this order"
    And I should find "1" history of order "test_order_1" in database
    And The order "test_order_1" status should be "3"
    # the customer change the order status from READY to COMPLETE
    Then I follow "Logout"
    And I follow "Login"
    And I fill in "Email" with "duckwcj@gmail.com"
    And I fill in "Password" with "123456"
    Then I press "Login"
    Then I follow "Cunjun Wang"
    Then I follow "Show All 1 Orders"
    And I should see "Order no: test_order_1"
    And I should see "COMPLETE this order"
    When I follow "COMPLETE this order"
    Then I should see "Order Status: FINISHED"
    And I should find "2" history of order "test_order_1" in database
    And The order "test_order_1" status should be "4"