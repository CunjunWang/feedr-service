Feature: edit truck

    As a foodtruck owner
    I want to edit information of my foodtruck
    So that I can give customers update of my truck

Scenario: edit foodtruck's name

    Given I create a truck with "test_name", "American", "test_addr", "test_description", "test_owner"
    When I click the edit button of the foodtruck
    Then I change the name to "new_name"
    Then I should see the truck with "new_name", "American", "test_addr", "test_description", "test_owner"

Scenario: edit foodtruck's type

    Given I create a truck with "test_name", "American", "test_addr", "test_description", "test_owner"
    When I click the edit button of the foodtruck
    Then I change the type to "Chinese"
    Then I should see the truck with "test_name", "Chinese", "test_addr", "test_description", "test_owner"

Scenario: edit foodtruck's address

    Given I create a truck with "test_name", "American", "test_addr", "test_description", "test_owner"
    When I click the edit button of the foodtruck
    Then I change the address to "new_addr"
    Then I should see the truck with "test_name", "American", "new_addr", "test_description", "test_owner"

Scenario: edit foodtruck's description

    Given I create a truck with "test_name", "American", "test_addr", "test_description", "test_owner"
    When I click the edit button of the foodtruck
    Then I change the description to "new_description"
    Then I should see the truck with "test_name", "American", "test_addr", "new_description", "test_owner"

Scenario: edit foodtruck's owner

    Given I create a truck with "test_name", "American", "test_addr", "test_description", "test_owner"
    When I click the edit button of the foodtruck
    Then I change the owner to "new_owner"
    Then I should see the truck with "test_name", "American", "test_addr", "test_description", "new_owner"
