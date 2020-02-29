Feature: User's Profile
  After login, the user can view the profile, including the basic profile as well as the foodtrucks and orders.

  Background:
    Given There are following users
      | email              | password | first_name | last_name | phone       |
      | mickey@monkees.com | password | Jason      | Lee       | 6463870372  |
      | 1@qq.com           | password | Jaye       | Lee       | 64618733172 |

  Scenario: Can view basic profile
    When I am on login
    And I fill in "Email" with "mickey@monkees.com"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should see "Logout"
    And I should not see "Login"
    When I follow "Jason Lee"
    Then I should be on /users/show
    And I should see "mickey@monkees.com"
    And I should see "6463870372"



