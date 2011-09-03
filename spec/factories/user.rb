Factory.define :user do |u|
  u.first_name 'Test'
  u.last_name  'User'
  u.sequence(:email) {|n| "person#{n}@example.com" }
  u.sequence(:username) {|n| "person#{n}" }
  u.password 'testtest1'
  u.password_confirmation 'testtest1'
  u.terms true
  u.bio 'Here is my biographic information'
  u.groups 'Better Business Bureau,Toastmasters'
  u.interests 'chess,baseball,football'
  u.industry 1
  u.industry_interested_1 1
  u.hometown_city 'New York'
  u.hometown_state 'NY'
  u.school 'NYU'
  u.major 'Film'
end