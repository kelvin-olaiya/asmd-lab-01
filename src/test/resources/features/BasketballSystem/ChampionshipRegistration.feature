@ignore
Feature: Registering to a championship

  Background:
    Given a team named "Lakers" that wants to register to the championship "NBA 2021"
    When the team manager logs into the federation reserved area and navigate to the "Championship registration" page
    And selects the championship "NBA 2021"
    And the team submits the form

  Scenario: A team registers to an open championship
    Given "NBA 2021" is an open championship
    Then the team is registered to the championship
    And the team receives a confirmation email with the details of the submission
    And the federation receives a notification of the registration to the championship

  Scenario: A team is admitted to a closed championship
    Given "NBA 2021" is a closed championship
    And the team meets the requirements to register
    Then the federation receives a notification of the registration to the championship
    And a federation official can approve the registration
    And the team is registered to the championship
    And the team receives a confirmation email with the details of the submission

  Scenario: A team is not admitted to a closed championship
    Given "NBA 2021" is a closed championship
    And the team does not meet the requirements to register
    Then the federation receives a notification of the registration to the championship
    And a federation official can reject the registration
    And the team receives a notification email with the details of the rejection
