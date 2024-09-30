Feature: Ending a player's membership

  Scenario: The team manager ends a player's membership
    Given a player named "LeBron James" that is a member of the team "Lakers"
    When the team manager logs into the federation reserved area and navigate to the "Players list page" page
    And finds the player in the player list
    And clicks on the "End Membership" button
    And writes a motivation and confirms the action
    Then the player is no longer a member of the team
    And the player receives a notification email

  Scenario: The player ends his membership
    Given a player named "LeBron James" that is a member of the team "Lakers"
    When the player logs into the federation reserved area and navigate to the "My profile" page
    And clicks on the "End Membership" button
    And writes a motivation and confirms the action
    Then the player is no longer a member of the team
    Then the team manager is notified
