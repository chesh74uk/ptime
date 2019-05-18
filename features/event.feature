Feature: Event
  
  In order to be able to manage events
  As a User
  I want to manage events
  
  Scenario: Create events
    Given a web browser is at the test details page
    When the Add event button is clicked
    And the event form has been filled in and submitted
    Then a new event should be created
    
  Scenario: Show events
    Given an event has been created
    And a web browser is at the test details page
    Then show me a list of existing events
    
  Scenario: Edit events
    Given an event has been created
    And a web browser is at the test details page
    When the edit event link is clicked
    And the event edit form has been filled in and submitted
    Then the new event details should be shown
    
  Scenario: Delete events
    Given an event has been created
    And a web browser is at the test details page
    When the delete event link is clicked
    Then the event should be deleted