Feature: edit menuitem

  As a foodtruck owner
  I want to edit menuitems
  So that I can better serve my customers

  Scenario: edit menuitem

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
    When I follow "Edit"
    And I fill in "menuitem[Name]" with "testitemname1"
    And I fill in "menuitem[Description]" with "testitemdescription1"
    And I fill in "menuitem[price]" with "9.0"
    And I press "Create Menuitem"
    When I follow "Edit"
    And I fill in "menuitem[Name]" with "testitemnamenew"
    And I fill in "menuitem[Description]" with "testitemdescriptionnew"
    And I fill in "menuitem[price]" with "19.0"
    And I press "Update Menuitem"
    Then I should see "testitemnamenew"
    And I should see "testitemdescriptionnew"
    And I should see "19.0"

