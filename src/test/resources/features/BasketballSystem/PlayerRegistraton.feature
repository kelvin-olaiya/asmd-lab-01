Feature: Player Membership

  Scenario: Registering a Player
    Given a player named "LeBron James" that wants to join the federation
    When his team manager logs into the federation reserved area and navigate to the "Register a team Player" page
    And fills the form with the player name "LeBron"
    * fills the form with the player surname "James"
    * fills the form with the player email
    * fills the form with the player city "Los Angeles"
    * fills the form the player country "USA"
    * fills the form with the player birthdate "December 30, 1984"
    * fills the form with the player height "6'9"
    * fills the form with the player weight "250 lbs"
    * fills the form with the player position "Small Forward"
    And the player submits the form
    Then the player receives a confirmation email with the datails of the submission
    And the player receives the credentials to access the federation website
