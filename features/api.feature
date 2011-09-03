Feature: API
	As a developer, I want to confirm that I can access the mobile API and to see a list of the supported methods available
	
Scenario: I go to the API index page and confirm I get shown information on the API
	When I go to the api home page
	Then I should see "Mobile API v.1"

