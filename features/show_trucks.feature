Feature: show created foodtruck

    As a foodtruck owner
    I want to see the content of my created foodtruck
    So that I can see the content of my foodtruck

Scenario: show content of a created foodtruck

    Given there is an existing user with email "mickey@monkees.com" and password "password"
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I press "Login"
    When I follow "Jason Lee"
    And I follow "Create a Food Truck"
    And I fill in "Name" with "testTruck1"
    And I select "American" from "Type"
    And I fill in "Description" with "testDescription1"
    And I fill in "Address" with "testAddress1"
    And I fill in "Owner" with "testOwner1"
    And I press "Save Foodtruck"
    When I follow "Show"
    Then I should see "testTruck1"
    And I should see "American"
    And I should see "testAddress1"
    And I should see "testDescription1"


