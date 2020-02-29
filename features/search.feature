Feature: Search
  Users can search for their interested truck using multi-conditions such as name, type, description and owner.

  Background: There are following foodtrucks
    Given There are following foodtrucks
      | Name           | Type     | Address               | Description            | Owner     | user_id |
      | Luoyang Uncle  | Chinese  | 354 Cathedral Parkway | Delicious Chinese Food | Jiefan Li | 1       |
      | Hamburger King | American | 2060 Broadway         | Great hamburgers       | Tom       | 2       |

  Scenario: Search by name
    When I am on homepage
    And I fill in "Name" with "Luoyang"
    And I press "Search"
    Then I should see "Luoyang Uncle"
    And I should not see "Hamburger King"

  Scenario: Search by Type
    When I am on homepage
    And I select "Chinese" from "Type"
    And I press "Search"
    Then I should see "Luoyang Uncle"
    And I should not see "Hamburger King"

  Scenario: Search by Address
    When I am on homepage
    And I fill in "Address" with "Cathedral"
    And I press "Search"
    Then I should see "Luoyang Uncle"
    And I should not see "Hamburger King"

  Scenario: Search by Description
    When I am on homepage
    And I fill in "Description" with "Chinese"
    And I press "Search"
    Then I should see "Luoyang Uncle"
    And I should not see "Hamburger King"

  Scenario: Search by Owner
    When I am on homepage
    And I fill in "Owner" with "Jiefan"
    And I press "Search"
    Then I should see "Luoyang Uncle"
    And I should not see "Hamburger King"