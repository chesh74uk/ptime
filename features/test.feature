Feature: Test
  
  In order to be able to manage tests
  As a User
  I want to manage tests
  
  Scenario: Create tests
    Given a web browser is at the test page
    When the Add test button is clicked
    And the test form has been filled in and submitted
    Then a new test should be created

  Scenario: Show tests
    Given a web browser is at the home page
    When the Manage tests link is clicked
    Then show me a list of existing tests
    
  Scenario: Edit tests
    Given a test has been created
    And a web browser is at the test page
    When the edit test link is clicked
    And the test edit form has been filled in and submitted
    Then the new test details should be shown

  Scenario: Delete tests
    Given a test has been created
    And a web browser is at the test page
    When the delete test link is clicked
    Then the test should be deleted
    
  Scenario: Show test details
    Given a test has been created
    And a web browser is at the test page
    When the test link is clicked
    Then show the details of the test