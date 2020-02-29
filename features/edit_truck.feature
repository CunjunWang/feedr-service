Feature: edit truck

    As a foodtruck owner
    I want to edit information of my foodtruck
    So that I can give customers update of my truck

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
    When I follow "Edit"
    And I fill in "foodtruck[Name]" with "testTrucknew"
    And I fill in "foodtruck[Description]" with "testDescriptionnew"
    And I fill in "foodtruck[Address]" with "testAddressnew"
    And I fill in "foodtruck[Owner]" with "testOwnernew"
    When I press "Update Foodtruck"
    Then I should see "testTrucknew"
    And I should see "testAddressnew"
