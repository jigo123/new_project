class Location

  attr_reader :address, :address_2, :city, :state, :zip
  attr_writer :lat, :lng
  
  def initialize(address, address_2, city, state, zip)
    @address = address
    @address_2 = address_2
    @city = city
    @state = state
    @zip = zip
  end
  
  def full_address
    "#{self.address}, #{self.city}, #{self.state} #{self.zip}"
  end
  
  def geocode
    if(!@lat)
      latlng = GeoKit::Geocoders::GoogleGeocoder.geocode("#{self.full_address}")
      self.lat = latlng.lat
      self.lng = latlng.lng
    end
  end
  
  def lat
    geocode
    @lat
  end

  def lng
    geocode
    @lng
  end

  def latlng
    geocode
    [@lat,@lng]
  end
  
end
