@ignore
Feature: Scheduling the championship matches

  Scenario: Adding a new match to the provisional schedule
    Given the championship "NBA 2021" is scheduled to start on "December 22, 2020"
    And the championship "NBA 2021" is scheduled to end on "May 16, 2021"
    * the federation official is logged into the federation reserved area
    * the championship schedule is not yet official
    When the official navigates to the "Schedule the championship matches" page
    And selects the championship "NBA 2021"
    * the official clicks on the "Add new match page"
    * the official specifies the home and away teams
    * the official specifies the match date
    * the official specifies the match start time
    * the official specifies the match location
    * the official specifies the match referee
    And the official submits the form
    Then the new match is added to the provisional schedule

  Scenario: Officializing the championship schedule
    Given the championship "NBA 2021" is scheduled to start on "December 22, 2020"
    And the championship "NBA 2021" is scheduled to end on "May 16, 2021"
    * the federation official is logged into the federation reserved area
    * the championship schedule is not yet official
    When the official navigates to the "Schedule the championship matches" page
    And selects the championship "NBA 2021"
    * the official clicks on the "Officialize the schedule" button
    Then the championship schedule is official
    And the affiliated teams receive a notification of the official schedule
    And the federation receives a notification of the official schedule
