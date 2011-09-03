World(Rack::Test::Methods)

When /^I try to check in with invalid credentials$/ do
  get "/api/v1/checkin?email=wrong@email.com&password=wrong_password&id=1"
end

Then /^the response should be "([^\"]*)"$/ do |status|
  last_response.status.should == status.to_i
end


=begin
When /^I go to the checkin page$/ do |path|
  get "/api/v1/checkin?email=wrong@email.com&password=wrong_password&id=1"
end

Given /^I send and accept JSON$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

When /^I send a POST request to "([^\"]*)" with the following:$/ do |path, body|
  post "/api/v1#{path}", body
end

When /^I send a POST request to "([^\"]*)"$/ do |path|
  post "/api/v1#{path}"
end

When /^I send a GET request for "([^\"]*)"$/ do |path|
  get path
end

Then /^the response should be "([^\"]*)"$/ do |status|
  last_response.status.should == status.to_i
end

Then /^the JSON response should be displayed$/ do
  page = JSON.parse(last_response.body)
  puts page
end

Then /^the JSON response should be an array with (\d+) "([^\"]*)" elements$/ do |number_of_children, name|
  page = JSON.parse(last_response.body)
  page.map { |d| d[name] }.length.should == number_of_children.to_i
end
=end

