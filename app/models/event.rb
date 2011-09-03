class Event < ActiveRecord::Base

  CATEGORIES = ['Convention','Conference','Trade Show','Networking Event','Seminar','Networking Group','Charity Event','Other']  

  acts_as_mappable

  include Checkinable
  include Truncatable
  
  has_attached_file :logo,
        :storage => :s3,
        :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
        :default_url => "http://tap.heroku.com/api/images/calendar.png",
        :path => "/event_logo/:style/:filename"

  has_many :users
  belongs_to :place
  belongs_to :creator, :class_name => "User"
  
  
  def self.near(lat, lng)
    self.within(0.5, :origin => [lat,lng]).order('distance')
  end

  def category_name
    if category
      "(#{Event::CATEGORIES[category.to_i]})"
    end
  end

  def distance_away
    "#{(distance.to_f * 5280).round} ft" rescue nil
  end

  def pretty_ends_at
    self.end.to_formatted_s(:long) if self.end.present?
  end

  def pretty_starts_at
    self.start.to_formatted_s(:long) if self.start.present?
  end
  
  def short_address
    self.place.address.truncate(25, :separator => ' ') rescue nil
  end
  
  def logo_url
    self.logo.url
  end

end
