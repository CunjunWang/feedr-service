Feature: create new foodtruck

    As a user
    I want to create my own foodtruck
    So that I can use Feedr to better serve my customers

Scenario: create a new foodtruck

    Given I login to my homepage
    When I create a new foodtruck with "test_name", "American", "test_address", "test_description", "test_owner"
    Then I should see a new foodtruck with "test_name", "American", "test_address", "test_description", "test_owner"

