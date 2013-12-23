Feature: Running SML tests
  In order to ensure that my SML is working
  As a programmer
  I want to be able to run tests

  Scenario: Running tests
    Given I have written an SML file with tests
    When I run smlspec on the file
    Then I should see the test output

