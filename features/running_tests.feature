Feature: Running SML tests
  In order to ensure that my SML is working
  As a programmer
  I want to be able to run tests

  Scenario: Running tests
    Given I have written an SML file with tests
    When I run smlspec on the file
    Then I should see the test output

  Scenario: A compile error happends
    Given I have an invalid SML file
    When I run smlspec on the file
    Then I should see a compile error message

  Scenario: Running it without Moscow ML installed
    Given I have written an SML file with tests
    And I don't have Moscow ML installed
    When I run smlspec on the file
    Then I should see message saying that I don't have Moscow ML installed
