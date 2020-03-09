Feature: create new foodtruck

  As a user
  I want to create my own foodtruck
  So that I can use Feedr to better serve my customers

  Scenario: create a new foodtruck

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
    Then I should see "testTruck1"
    And I should see "American"
    And I should see "testAddress1"
