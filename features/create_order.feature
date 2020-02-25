Feature: Current user create a new order

  Background: The user has added all the items he/she wants to the cart

    Given the following items in session:
      | item_id | item_name   | item_price | quantity |
      | 1       | Test item1  | 9.0        | 1        |
      | 2       | Test item 2 | 10.5       | 2        |

    And I am on the food truck 1 page
    Then 3 items should exist

  Scenario: checkout order
    When I follow "Checkout"
    Then I should be on "/orders/checkout"