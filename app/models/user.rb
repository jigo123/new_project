class User < ActiveRecord::Base

  INDUSTRIES = ['General', 'Accounting/Bookkeeping/Tax Prep', 'Advertising/Marketing/PR', 'Architecture/Interior Design', 'Automotive', 'Business/Trade/Networking Organization', 'Banking/Finance', 'Business Consulting', 'Construction/Contracting', 'Design/Creative Services', 'Education', 'Engineering', 'Environmental Services', 'Fashion/Apparel', 'Food Services', 'Government', 'Healthcare', 'HR/Benefits/Payroll/Staffing', 'Insurance', 'IT Services/Products', 'Janitorial', 'Law Practice/Legal', 'Services', 'Manufacturing', 'Media', 'Not-For-Profit', 'Office Supplies/Equipment', 'Other', 'Plastics', 'Printing', 'Publishing', 'Real Estate', 'Recreation/Entertainment', 'Recycling', 'Restaurant', 'Retail', 'Security Services', 'Shipping/Warehousing', 'Telecommunications', 'Transportation', 'Travel/Hospitality/Tourism', 'Web Design/Online Marketing']
  
  belongs_to :place
  belongs_to :event

  has_attached_file :photo,
        :storage => :s3,
        :s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
        :path => "/userphoto/:style/:filename",
        :default_url => "http://tap.heroku.com/api/images/profile.png",
        :styles => { :thumbnail_small => ["45x45", :png], :thumbnail_large => ["100x100", :png]}
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :username, :uniqueness => true, :on => :create
  validates_format_of :password, :with =>/(?=.*\d)/, :message => "Your password must include at least one number", :on => :create
  validates_format_of :password, :with =>/(?=.*[a-zA-Z])/, :message => "Your password must include at least one letter", :on => :create
  validates_presence_of :terms, :message => "You must accept the terms and conditions", :on => :create

  def groups_array
    if groups
      return groups.split(/,/).each {|a| a.strip!}.reject(&:blank?)
    else
      return []
    end
  end

  def industries_interested
    industries = []
    if industry_interested_1
      industries << industry_interested_1
    end
    if industry_interested_2
      industries << industry_interested_2
    end
    if industry_interested_3
      industries << industry_interested_3
    end
    industries
  end

  def industries_interested_names
    names = []
    if industry_interested_1
      names << User::INDUSTRIES[industry_interested_1.to_i]
    end
    if industry_interested_2
      names << User::INDUSTRIES[industry_interested_2.to_i]
    end
    if industry_interested_3
      names << User::INDUSTRIES[industry_interested_3.to_i]
    end
    names
  end

  def industry_name
    if industry
      User::INDUSTRIES[industry.to_i]
    end
  end
  
  def interests_array
    if interests
      return interests.split(/,/).each {|a| a.strip!}.reject(&:blank?)
    else
      return []
    end
  end

  def match(matching_user)
    @match = []
    if self != matching_user
      match_buy(matching_user)
      match_sell(matching_user)
      match_like(matching_user)
    end
    @match
  end

  def first_match_reason
    @match.first
  end
  
  def match_reasons
    @match
  end
  
  def matches
    @match.size > 0
  end

  def name
    "#{first_name} #{last_name}"
  end

  private

  def match_groups(matching_user)
    shared_groups = groups_array & matching_user.groups_array
    if shared_groups.length 
      shared_groups.each{ |groups|
        @match << "You have an association in common (#{groups})" 
      }
    end
  end

  def match_buy(matching_user)
    if matching_user.industry != nil and industries_interested.find matching_user.industry
      @match << "They are interested in your industry: #{matching_user.industry_name}" 
    end
  end

  def match_hometown(matching_user)
    if hometown_city != nil and hometown_state != nil and hometown_city == matching_user.hometown_city and hometown_state == matching_user.hometown_state
      @match << "You share the same home town (#{hometown_city}, #{hometown_state})" 
    end
  end

  def match_interests(matching_user)
    shared_interests = interests_array & matching_user.interests_array
    if shared_interests.length 
      shared_interests.each{ |interest|
        @match << "You have an interest in common (#{interest})" 
      }
    end
  end

  def match_like(matching_user)
    match_hometown(matching_user)
    match_school(matching_user)
    match_major(matching_user)
    match_interests(matching_user)
    match_groups(matching_user)
  end

  def match_major(matching_user)
    if major != nil and major == matching_user.major
      @match << "You had the same major (#{major})" 
    end
  end

  def match_school(matching_user)
    if school != nil and school == matching_user.school
      @match << "You went to the same school (#{school})" 
    end
  end

  def match_sell(matching_user)
    if industry != nil and matching_user.industries_interested.find industry
      @match << "You are interested in their industry: #{industry_name}" 
    end
  end
  
  def photo_url
    self.photo.url
  end
  
  def as_json(options={})
    super(:methods => [:photo_url])
  end  
    
end
