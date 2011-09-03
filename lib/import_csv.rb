require 'config/environment'

FasterCSV.foreach('csvs/eventspaces_geocoded.csv') do |row|
  if row[0] != 'Name'
    @place = Place.create(:name => row[0], :address => row[1], :city => row[2], :state => row[3], :postcode => row[4], :category => Place::CATEGORIES.index(row[5]), :lat => row[6], :lng => row[7] )
  end
end
