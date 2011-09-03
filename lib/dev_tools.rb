require 'faker'

class DevTools
  
  def self.populate_place_with_fake_checkins(place_id,count=10)
    count.times do
      # make a person
      u=User.create(:first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => Faker::Internet.email, :password => 'password1', :password_confirmation => 'password1', :username => Faker::Internet.user_name, :terms => true)
      # checkin to location
      u.save
      puts "#{place_id}"
      Place.checkin(place_id,u)
    end
  end
  
end