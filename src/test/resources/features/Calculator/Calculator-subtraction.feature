Feature: Subtraction Operation on Calculator

  Background:
    Given I have a Calculator

  Scenario: Subtract two positive integers
    When I subtract 10 from 20
    Then the result of the subtraction should be 10

  Scenario: Subtract a negative integer from a positive integer
    When I subtract -5 from 8
    Then the result of the subtraction should be 13

  Scenario: Subtract a positive integer from a negative integer
    When I subtract 10 from -3
    Then the result of the subtraction should be -13

  Scenario: Subtract two negative integers
    When I subtract -10 from -5
    Then the result of the subtraction should be 5

  Scenario Outline: Subtract various integers
    When I subtract <subtrahend> from <minuend>
    Then the result of the subtraction should be <expected_result>

    Examples:
      | minuend | subtrahend | expected_result |
      | 15      | 7          | 8               |
      | 20      | 20         | 0               |
      | -10     | -5         | -5              |
