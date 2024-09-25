Feature: OOP GUI Exam
    We want to implement a GUI.
    The GUI consist of a grid of cells made of buttons.
    The GUI allows to select 5 cells, then move them all to the left until the border, 
    then all to the right until the other border.

  Background:
    Given a square grid of size 10

  Scenario: Selecting the 5 cells
    When the user clicks on the first 5 cells
    Then the cells are numbered from 1 to 5

  Scenario: Moving cells to the left
    Given the user has clicked on 5 cells
    And none of the numbered cells are at the left border
    When the user clicks on any other cell
    Then the numbered cells are moved to the left by one position

  Scenario: Moving cells to the right
    Given the user has clicked on 5 cells
    And the user has clicked on any of the cell until the farmost-left numbered cell has reached the left border
    And none of the numbered cells are at the right border
    When the user clicks on any other cell
    Then the numbered cells are moved to the right by one position

  Scenario: End of the game
    Given the user has clicked on 5 cells
    And the user has clicked on any of the cell until the farmost-left numbered cell has reached the left border
    And the user has clicked on any of the cell until the farmost-right numbered cell has reached the right border
    When the user clicks on any other cell
    Then the game ends
