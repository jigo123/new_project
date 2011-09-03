Feature: Registration
	As a user, I want to be able to register so I can create an account

Background:  
	Given I go to the logout page
	And I go to the registration page

Scenario: If I don't enter an email address, I should be shown the registration form with an error message
	Given I have the test user
	When I fill in "user_password" with "testtest1"
	And I fill in "user_password_confirmation" with "testtest1"
	And I press "Sign up"
	Then I should see "Sign up"
	And I should see "Email can't be blank"

Scenario: If I enter an existing email address, I should be shown the registration form with an error message
	Given I have the test user
	When I fill in "user_email" with "test@test.com"
	And I fill in "user_password" with "testtest1"
	And I fill in "user_password_confirmation" with "testtest1"
	And I check "user_terms"
	And I press "Sign up"
	Then I should see "Sign up"
	And I should see "Email has already been taken"

Scenario: If I enter a password that is too short, I should be shown the registration form with an error message
	Given I have the test user
	When I fill in "user_email" with "new@test.com"
	And I fill in "user_username" with "NewTestUsername"
	And I fill in "user_password" with "test1"
	And I fill in "user_password_confirmation" with "test1"
	And I check "user_terms"
	And I press "Sign up"
	Then I should see "Sign up"
	And I should see "Password is too short"

Scenario: If I enter a password that doesn't include a number, I should be shown the registration form with an error message
	Given I have the test user
	When I fill in "user_email" with "new@test.com"
	And I fill in "user_username" with "NewTestUsername"
	And I fill in "user_password" with "testtest"
	And I fill in "user_password_confirmation" with "testtest"
	And I check "user_terms"
	And I press "Sign up"
	Then I should see "Sign up"
	And I should see "Your password must include at least one number"

Scenario: If I enter a password that doesn't include a letter, I should be shown the registration form with an error message
	Given I have the test user
	When I fill in "user_email" with "new@test.com"
	And I fill in "user_username" with "NewTestUsername"
	And I fill in "user_password" with "1234567"
	And I fill in "user_password_confirmation" with "1234567"
	And I check "user_terms"
	And I press "Sign up"
	Then I should see "Sign up"
	And I should see "Your password must include at least one letter"

Scenario: If I enter a password confirmation that doesn't match the password, I should be shown the registration form with an error message
	When I fill in "user_email" with "peter@pbell.com"
	And I fill in "user_password" with "testtest1"
	And I fill in "user_password_confirmation" with "wrongtest1"
	And I check "user_terms"
	And I press "Sign up"
	Then I should see "Sign up"
	And I should see "Password doesn't match confirmation"

Scenario: If I enter an existing username, I should be shown the registration form with an error message
	Given I have the test user
	When I fill in "user_email" with "new@test.com"
	And I fill in "user_username" with "TestUsername"
	And I fill in "user_password" with "testtest1"
	And I fill in "user_password_confirmation" with "testtest1"
	And I check "user_terms"
	And I press "Sign up"
	Then I should see "Sign up"
	And I should see "Username has already been taken"

Scenario: If I don't accept the terms, I should be shown the registration form with an error message
	Given I have the test user
	When I fill in "user_email" with "new@test.com"
	And I fill in "user_username" with "NewUsername"
	And I fill in "user_password" with "testtest1"
	And I fill in "user_password_confirmation" with "testtest1"
	And I press "Sign up"
	Then I should see "Sign up"
	And I should see "You must accept the terms and conditions"
	
Scenario: If I fill out the registration form correctly, I should be shown my profile page
	When I fill in "user_email" with "peter@pbell.com"
	And I fill in "user_password" with "testtest1"
	And I fill in "user_password_confirmation" with "testtest1"
	And I fill in "user_first_name" with "Test"
	And I fill in "user_last_name" with "User"
	And I fill in "user_username" with "TestUsername"
	And I check "user_terms"
	And I check "user_subscribe_to_announcements"
	And I check "user_subscribe_to_events"
	And I press "Sign up"
	Then I should see "Signed in as peter@pbell.com"
	And I should see "Edit Profile"
