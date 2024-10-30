@ignore
Feature: Team Affiliation

  Background:
    Given a team named "Lakers" that want to join the federation
    When the team manager opens the federation website and navigate to the "Join the federation" page
    And fills the form with the team name "Lakers"
    * fills the form with the team email
    * fills the form with the team city "Los Angeles"
    * fills the form the team country "USA"
    * fills the form with the address of the game arena "Staples Center"
    * fills the form with the team colors "Purple and Gold"
    * fills the form with the team manager "Jeanie Buss"
    * fills the form with the team coach "Frank Vogel"
    * fills the form with the team assistant coach "Jason Kidd"

  Scenario: Submitting a team affiliation
    When the team submits the form
    Then the team receives a confirmation email with the datails of the submission

  Scenario: Approving a team affiliation
    When the team submits the form
    Then a federation official can review the team submission
    And approve the team affiliation
    And the team receives a confirmation email with the details of the approval
    And the credentials to access the federation website

  Scenario: Rejecting a team affiliation
    When the team submits the form
    Then a federation official can review the team submission
    And reject the team affiliation
    And the team receives a confirmation email with the details of the rejection
