Feature: User's Profile
  After login, the user can view the profile, including the basic profile as well as the foodtrucks and orders.

  Background:
    Given There are following users
      | email              | password | first_name | last_name | phone       |
      | mickey@monkees.com | password | Jason      | Lee       | 6463870372  |
      | 1@qq.com           | password | Jaye       | Lee       | 64618733172 |
    Given There are following orders
      | order_no | truck_id | user_id | order_subtotal | truck_name     |
      | 1        | 2        | 1       | 11.11          | Hamburger King |

  Scenario: Can view basic profile, user has foodtruck and order
    Given There are following foodtrucks
      | Name           | Type     | Address               | Description            | Owner     | user_id |
      | Luoyang Uncle  | Chinese  | 354 Cathedral Parkway | Delicious Chinese Food | Jiefan Li | 1       |
      | Hamburger King | American | 2060 Broadway         | Great hamburgers       | Tom       | 2       |
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should see "Logout"
    And I should not see "Login"
    When I follow "Jason Lee"
    Then I should be on /users/show
    And I should see "Email: mickey@monkees.com"
    And I should see "Phone: 6463870372"
    And I should see "Order no: 1"
    And I should see "Order status: PREPARING"
    And I should see "Order Subtotal: $ 11.11"
    And I should see "Luoyang Uncle"

  Scenario: Can view basic profile, user does not have foodtruck
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should see "Logout"
    And I should not see "Login"
    When I follow "Jason Lee"
    Then I should be on /users/show
    And I should see "Email: mickey@monkees.com"
    And I should see "Phone: 6463870372"
    And I should see "Order no: 1"
    And I should see "Order status: PREPARING"
    And I should see "Order Subtotal: $ 11.11"
    And I should not see "Luoyang Uncle"
    And I should see "You don't have any truck, why not Create one?"



