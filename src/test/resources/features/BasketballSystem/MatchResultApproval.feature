@ignore
Feature: Match result approval

  Scenario: Approving a match result
    Given the match "Lakers vs Celtics" was played on "December 25, 2020"
    And the match result was "Lakers 100 - Celtics 98"
    And the match referee "John Doe" submitted the result
    When the federation official navigates to the "Match results approval" page
    And selects the match "Lakers vs Celtics"
    And approves the result
    Then the match result is official
    And the affiliated teams receive a notification of the official result
    And the federation receives a notification of the official result
