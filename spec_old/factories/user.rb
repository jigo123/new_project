Factory.define :user do |u|
  u.first_name 'Test'
  u.last_name  'User'
  u.email 'test@test.com'
  u.username 'TestUsername'
  u.password 'testtest1'
  u.password_confirmation 'testtest1'
  u.terms true
  u.bio 'I have a bio'
end
