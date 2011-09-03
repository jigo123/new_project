require 'config/environment'

original_csv = FasterCSV.read("csvs/eventspaces.csv")
# remove the headers
original_csv.slice!(0)

original_csv.each do |row|
  @place = Place.new(:name => row[0], :address => row[1], :city => row[2], :state => row[3], :postcode => row[4], :category => Place::CATEGORIES.index(row[5]))
  @place.geocode
  row << @place.lat
  row << @place.lng
  sleep 0.1 # To stop the geocoding from getting rate limited by google 
end
FasterCSV.open("csvs/eventspaces_geocoded.csv", "w") do |csv|
    original_csv.each do |row|
      csv << row
    end
end