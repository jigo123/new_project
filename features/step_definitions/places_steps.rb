When /^I fill in a valid address$/ do
  fill_in("address", :with => "419 lafayette") 
  fill_in("city", :with => "new york") 
  fill_in("state", :with => "ny") 
  fill_in("zip", :with => "10003") 
end



