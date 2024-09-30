Feature: Creating a new championship

  Scenario: Creating an open championship
    Given a federation official is logged into the federation reserved area
    When the official navigates to the "Create a new championship" page
    And fills the form with the championship name "NBA 2021"
    * fills the form with the championship start date "December 22, 2020"
    * fills the form with the championship end date "May 16, 2021"
    * fills the form with the championship expected teams "30"
    * fills the form with the championship expected games "72"
    * fills the form with the registration deadline "November 30, 2020"
    And the official submits the form
    Then the affiliated teams receives a notification of the creation of the new championship

  Scenario: Creating a closed championship
    Given a federation official is logged into the federation reserved area
    When the official navigates to the "Create a new championship" page
    And fills the form with the championship name "NBA 2021"
    * fills the form with the championship start date "December 22, 2020"
    * fills the form with the championship end date "May 16, 2021"
    * fills the form with the championship maximum teams "30"
    * fills the form with the players allowed age range "18-21"
    * fills the form with the registration deadline "November 30, 2020"
    And the official submits the form
    Then the affiliated teams receives a notification of the creation of the new championship
