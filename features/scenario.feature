Feature: Scenario
  
  In order to be able to manage scenarios
  As a User
  I want to manage scenarios
  
  Scenario: Create scenarios
    Given a web browser is at the scenario page
    When the Add scenario button is clicked
    And the scenario form has been filled in and submitted
    Then a new scenario should be created

  Scenario: Show scenarios
    Given a web browser is at the home page
    When the Manage scenarios link is clicked
    Then show me a list of existing scenarios
    
  Scenario: Edit scenarios
    Given a scenario has been created
    And a web browser is at the scenario page
    When the edit scenario link is clicked
    And the scenario edit form has been filled in and submitted
    Then the new scenario details should be shown

  Scenario: Delete scenarios
    Given a scenario has been created
    And a web browser is at the scenario page
    When the delete scenario link is clicked
    Then the scenario should be deleted