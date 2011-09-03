Feature: Authenticate
	As a user, I want to be able to log in successfully to access my account information

Background:  
	Given I have the test user
	And I go to the logout page
	And I go to the login page

Scenario: I log in with invalid credentials and make sure I am not signed in
	When I fill in "user_email" with "invalid@email"
	And I fill in "user_password" with "invalidpassword"
	And I press "Sign in"
	Then I should see "Invalid email or password"

Scenario: I log in with valid credentials and make sure I am signed in correctly
	When I fill in "user_email" with "test@test.com"
	And I fill in "user_password" with "testtest1"
	And I press "Sign in"
	Then I should see "Signed in as test@test.com"

