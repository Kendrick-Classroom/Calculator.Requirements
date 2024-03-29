Feature: 
As a user,
I want to be able to input numbers as operands and use an addition operator
to view the resulting summation.

@console
  Scenario Outline: Add two numbers
    Given an active console window
     When I input the operand <x>
      And the addition operator "+"
      And the operand <y>
     Then I expect to see <z> as output.
  
    Examples: 
      | x                   | y           | z             | 
      | 0                   | 0           | 0             | 
      | 1                   | 0           | 1             | 
      | 0                   | 1           | 1             | 
      | 1                   | 1           | 2             | 
      | 9                   | 1           | 10            | 
      | 1                   | 9           | 10            | 
      | -1                  | 0           | -1            | 
      | 0                   | -1          | -1            | 
      | 2147483647          | 1           | 2147483648    | 
      | 1                   | 2147483647  | 2147483648    | 
      | -1                  | -2147483648 | -2147483649   | 
      | "9,000,000,000,000" | 1           | 9000000000001 | 
  
  @console
  Scenario Outline: Add multiple numbers
    Given an active console window
     When I input the numbers: <input> delimited by the addition operator "+"
     Then I expect a single <output> as the sum.
  
    Examples: 
      | input       | output | 
      | "0 + 1 + 2" | 3      | 
      | "10+11+111" | 132    | 
      | "-1 +2+ -3" | -2     | 
  
  @console @fault
  Scenario Outline: Invalid inputs output messages
    Given an active console window
     When I input invalid values: <input>
     Then I expect to see the message <error> as output
  
    Examples: 
      | input   | error                                                  | 
      | ""      | "An input must be supplied."                           | 
      | "  "    | "An input must be supplied."                           | 
      | "1"     | "A number without operands isn't a valid expressions." | 
      | "+1"    | "A binary operator requires two inputs."               | 
      | "-1"    | "A binary operator requires two inputs."               | 
      | "1c"    | "Only numbers are currently supported."                | 
      | "1.000" | "Fractional numbers aren't supported at this time."    | 
      | "1*1"   | "Invalid character '*' was detected."                  |
