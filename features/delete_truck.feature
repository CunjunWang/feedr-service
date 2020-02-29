Feature: delete existing foodtrucks

    As a user
    I want to shut down my own foodtruck
    So that I can inform my customers that my foodtruck is no longer open

Scenario: delte an existing foodtruck

    Given I create a truck with "test_name", "American", "test_addr", "test_description", "test_owner"
    When I delete that foodtruck
    Then I should no foodtruck with "test_name", "American", "test_address", "test_description", "test_owner" on my page

