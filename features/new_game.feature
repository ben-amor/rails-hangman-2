Feature: New Game

  Scenario: Creating a new game
    Given I am on the new game screen
    When I start a game
    Then I am taken to the edit game screen
