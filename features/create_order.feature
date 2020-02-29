Feature: Current user create a new order

  Scenario: checkout order
    When I am on the home page
    And I follow "Show"
    Then I should be on "/foodtrucks/1"
    And I follow "checkout"
    Then I should be on "/orders/checkout"