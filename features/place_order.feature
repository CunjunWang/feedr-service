Feature: Place Order
  I can place order to a food truck.

  Background:
    Given There are following users
      | id | email               | password | first_name | last_name | phone       |
      | 1  | mickey@monkees.com  | password | Jason      | Lee       | 6463870372  |
      | 2  | cw3199@columbia.wdu | 123456   | 3199       | cw        | 6047830732  |
      | 3  | duckwcj@gmail.com   | 123456   | Cunjun     | Wang      | 6466413916  |
      | 4  | 1@qq.com            | password | Jaye       | Lee       | 64618733172 |
    Given There are following foodtrucks
      | id | Name          | Type    | Address               | Description            | Owner     | user_id |
      | 1  | Luoyang Uncle | Chinese | 354 Cathedral Parkway | Delicious Chinese Food | cw 3199 | 2       |
    Given There are following menu items
      | id | Description | Name                  | price | foodtruck_id |
      | 1  | test        | Fried Eggplant        | 9.50  | 1            |
      | 2  | test        | Garlic Pork           | 12.0  | 1            |
      | 3  | test        | Dry Pot Cabbage       | 11.5  | 1            |
      | 4  | test        | White Rice            | 1.0   | 1            |
      | 5  | test        | Sausage McBiscuit     | 4.20  | 1            |
      | 6  | test        | Iced Hazelnut Coffee  | 2.32  | 1            |
      | 7  | test        | BigMc Combo           | 15.88 | 1            |
      | 8  | test        | 20 Piece of McNugget  | 12.29 | 1            |
      | 9  | test        | Stewed Pork Burger    | 5.31  | 1            |
      | 10 | test        | Mouth Pouring Chicken | 8.22  | 1            |

  Scenario: Can add items to cart, checkout, and place order
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I press "Login"
    And I follow "Home"
    Then I should be on /
    When I follow "Show"
    Then I should be on /foodtrucks/1
    And I should not see "Checkout"
    When I add item 1 to cart
    Then I should see "Checkout"
    And I follow "Checkout"
    Then I should be on /orders/checkout
    And I should see "Go Back Edit"
    And I should see "Place Order"