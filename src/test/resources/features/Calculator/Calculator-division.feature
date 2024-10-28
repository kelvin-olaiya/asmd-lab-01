Feature: Division Operation on Calculator

  Background:
    Given I have a Calculator

  Scenario: Divide two positive numbers where the result is an integer
    When I divide 10 by 2
    Then the result of the division should be 5

  Scenario: Divide a positive number by a negative number where the result is an integer
    When I divide 12 by -3
    Then the result of the division should be -4

  Scenario: Divide two negative numbers where the result is an integer
    When I divide -20 by -5
    Then the result of the division should be 4

  Scenario Outline: Divide various numbers resulting in an integer
    When I divide <dividend> by <divisor>
    Then the result of the division should be <expected_result>

    Examples:
      | dividend | divisor | expected_result |
      | 15       | 5       | 3               |
      | 0        | 10      | 0               |
      | -24      | 3       | -8              |

  Scenario: Divide by zero
    When I divide 8 by 0
    Then an error should occur
