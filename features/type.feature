Feature: Type management

  In order to manage types
  As an user
  I want to create, edit and delete types

  Background:
    Given I am registered
    And I visit the homepage
    When I click on Sign in link
    And I fill in the sign in form
    Then I should see Signed in successfully

  @javascript
    Scenario: Create new type
      Given I visit the index page
      When I click on link Create Type and fill the form
      Then I should see a new type

  @javascript
    Scenario: See list of types I created
      Given I click on link Create Type and fill the form
      And I visit the index page

  @javascript
    Scenario: Edit created type
      Given I visit the index page
      When I click on link Create Type and fill the form
      Then I should see a new type
      When I click on Edit link
      And I change type name
      And I click on button Update Type
      Then I should see in table updated name

