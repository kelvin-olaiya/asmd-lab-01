Feature: Multiplication Operation on Calculator

  Scenario: Multiply two positive numbers
    Given I have a Calculator
    When I multiply 5 by 7
    Then the result of the product should be 35

  Scenario: Multiply a positive and a negative number
    Given I have a Calculator
    When I multiply -4 by 10
    Then the result of the product should be -40

  Scenario: Multiply two negative numbers
    Given I have a Calculator
    When I multiply -2 by -6
    Then the result of the product should be a positive number

  Scenario: Multiply two negative numbers
    Given I have a Calculator
    When I multiply -6 by -3
    Then the result of the product should be 18

  Scenario Outline: Multiply various numbers
    Given I have a Calculator
    When I multiply <operand1> by <operand2>
    Then the result of the product should be <expected_result>

    Examples:
      | operand1 | operand2 | expected_result |
      | 3        | 4        | 12              |
      | 0        | 10       | 0               |
      | -5       | 6        | -30             |
