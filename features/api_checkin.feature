Feature: API Checkin
	As an API client, I want to be able to check in

Scenario: Checkin should fail for a user with invalid credentials
	When I try to check in with invalid credentials
	Then the response should be "200"
