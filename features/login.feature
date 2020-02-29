Feature: Login
  In order to use Feedr
  As a user
  I want to be able to login

  Scenario: Successful login
    Given there is an existing user with email "mickey@monkees.com" and password "password"
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should see "Logout"
    And I should not see "Login"

  Scenario: Unsuccessful login, the password and email don't match
    Given there is an existing user with email "mickey@monkees.com" and password "password"
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password111"
    And I press "Login"
    Then I should see "Login"
    And I should not see "Logout"
