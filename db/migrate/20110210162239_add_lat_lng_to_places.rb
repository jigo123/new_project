class AddLatLngToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places, :lat, :string
    add_column :places, :lng, :string
  end

  def self.down
    remove_column :places, :lng
    remove_column :places, :lat
  end
end
