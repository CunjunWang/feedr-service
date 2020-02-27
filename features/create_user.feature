Feature: Sign Up
  In order to use Feedr
  As a user
  I want to be able to sign up

  Scenario: Successful registration
    When I am on users/new
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I fill in "First name" with "Jason"
    And I fill in "Last name" with "Lee"
    And I fill in "Phone" with "6463870372"
    And I press "Sign up"
    Then I should see "Jason Lee"
    And I should see "Logout"
    And I should not see "Sign Up"

  Scenario: An existing user is using the same email address
    Given An existing user is using "mickey@monkees.com"
    When I am on users/new
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I fill in "First name" with "Jason"
    And I fill in "Last name" with "Lee"
    And I fill in "Phone" with "6463870372"
    And I press "Sign up"
    Then I should see "Email has already been taken"
    And I should see "Sign Up"