Feature: Search for nearby locations
	As a tester, I want to be able to find locations near a given address to make sure we have a good list of places available

Scenario: I search for my office and make sure The Public Theater shows up as a nearby location
	Given I go to the search page
	When I fill in a valid address
	And I press "Find Places"
	Then I should see "The Public Theater"

Scenario: I filter the results near my office with 'Joe' and make sure I still see Joe's pub but don't see The Public Theatre
	Given I go to the search page
	When I fill in a valid address
	And I fill in "query" with "Joe"
	And I press "Find Places"
	Then I should see "Joe's Pub"
	And I should not see "The Public Theater"

Scenario: I filter the results near my office for Restaurants and make sure I still see Joe's pub but don't see The Public Theatre
		Given I go to the search page
		When I fill in a valid address
		And I fill in "category" with "Restaurant"
		And I press "Find Places"
		Then I should see "Joe's Pub"
		And I should not see "The Public Theater"

