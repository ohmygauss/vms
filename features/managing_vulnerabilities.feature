Feature: Listing and CRUDing Vulnerabilities

  Scenario: Adding a vulnerabity to a product
  Given some products exist
    And I navigate to the show view for a particular product
  When I click on the link to "Add Vulnerability"
  Then I am taken to a form
    And I can input the details for a new vulnerability
    And those details are used to create a new vulnerability