class Place < ActiveRecord::Base

  CATEGORIES = ['Convention Center','Conference Center','Event Space','Public Space','Restaurant','Other']  

  acts_as_mappable
  
  include Checkinable
  include Truncatable
  
  has_many :users
  has_many :events
  
  def self.near(lat, lng)
    self.within(0.5, :origin => [lat,lng]).order('distance')
  end

  def category_name
    if category
      "(#{Place::CATEGORIES[category.to_i]})"
    end
  end

  def distance_away
    "#{(distance.to_f * 5280).round} ft" rescue nil
  end

  def full_address
    "#{self.address}, #{self.city}, #{self.state} #{self.postcode}"
  end
  
  def short_address
    self.address.truncate(25, :separator => ' ') rescue nil
  end
  

  def geocode
      latlng = GeoKit::Geocoders::GoogleGeocoder.geocode("#{self.full_address}")
      self.lat = latlng.lat
      self.lng = latlng.lng
  end
  
end
