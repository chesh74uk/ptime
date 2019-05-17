Feature: Customer
  
  In order to be able to manage customers
  As a User 
  I want to be able to manage customers
  
  Scenario: Create customers
    Given a web browser is at the customer page
    When the Add customers button is clicked
    And the customer form has been filled in and submitted
    Then a new customer should be created
    
  Scenario: Show customers
    Given a web browser is at the home page
    When the Manage customers link is clicked
    Then show me a list of existing customers
    
  Scenario: Edit customers
    Given a customer has been created
    And a web browser is at the customer page
    When the edit customer link is clicked
    And the edit form has been filled in and submitted
    Then the new customer details should be shown

  Scenario: Edit customers
    Given a customer has been created
    And a web browser is at the customer page
    When the delete customer link is clicked
    Then the customer should be deleted