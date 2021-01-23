Feature: User authentification
  In order to access website
  As an user
  I should have an option to sign in, sign up and sign out

  Scenario: Sign in
    Given I am registered
    And I visit the homepage
    When I click on Sign in link
    And I fill in the sign in form
    Then I should see Signed in successfully

  Scenario: Sign up
    Given I visit the homepage
    When I click on Sign up link
    And I fill in the sign up form
    Then I should see Welcome! You have signed up successfully

  Scenario: Sign out
    Given I am registered
    And I visit the homepage
    When I click on Sign in link
    And I fill in the sign in form
    Then I should see Signed in successfully
    When I click on Sign out link
    Then I should be redirected to the homepage
