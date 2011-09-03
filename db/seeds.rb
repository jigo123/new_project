# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create! :first_name => 'Test', :last_name => 'User', :email => 'test@test.com', :username => 'TestUserName', :password => 'test1234', :password_confirmation => 'test1234', :terms => true

place = Place.create! :name => 'The Public Theater', :address => '425 Lafayette St', :city => 'New York', :state => 'NY', :postcode => '10003', :lat => '40.728714', :lng => '-73.992082'

place = Place.create! :name => 'Butter Restaurant', :address => '415 Lafayette St', :city => 'New York', :state => 'NY', :postcode => '10003', :lat => '40.728444', :lng => '-73.992117'

place = Place.create! :name => 'Astors Inc', :address => '428 Lafayette St', :city => 'New York', :state => 'NY', :postcode => '10003', :lat => '40.7287', :lng => '-73.992271'

