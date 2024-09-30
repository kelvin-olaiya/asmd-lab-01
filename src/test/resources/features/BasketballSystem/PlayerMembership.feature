Feature: Player team membership

  Background:
    Given a team and a player are already registered
    When the manager logs into the federation reserved area and navigate to the "Submit a player membership" page
    And finds the player in the player list

  Scenario: Confirming a player membership
    When the team manager submits the form
    Then the player receives a notification email
    And the player can access the federation reserved area
    And the player can confirm the membership
    And the team manager receives a notification email with the details of the confirmation

  Scenario: Rejecting a player membership
    When the team manager submits the form
    Then the player receives a notification email
    And the player can access the federation reserved area
    And the player can reject the membership
    And the team manager receives a notification email with the details of the rejection
