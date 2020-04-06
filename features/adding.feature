Feature: 
  As a user,
  I want to be able to input numbers as operands
  and use an addition operator
  to view the resulting summation.

@console
Scenario Outline: Add two numbers
  Given an active console window
  When I input the operand <x>
    And the addition operator "+"
    And the operand <y>
  Then I expect to see <z> as output.
  
Examples:
| x                   | y             | z               |
| 0                   | 0             | 0               |
| 1                   | 0             | 1               |
| 0                   | 1             | 1               |
| 1                   | 1             | 2               |
| 9                   | 1             | 10              |
| 1                   | 9             | 10              |
| -1                  | 0             | -1              |
| 0                   | -1            | -1              |
| 2147483647          | 1             | 2147483648      |
| 1                   | 2147483647    | 2147483648      |
| -1                  | -2147483648   | -2147483649     |
| "9,000,000,000,000" | 1             | 9000000000001   |
