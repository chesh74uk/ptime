Feature: Home page
  
  In order to be able to use the system
  As a User 
  I want to be able to access the system
  
  Scenario: Welcome page
    When a web browser is at the home page
    Then show a manage customers link
    And a manage scenarios link
    And a manage tests link
    
  
  