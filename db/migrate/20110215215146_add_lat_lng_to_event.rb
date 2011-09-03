class AddLatLngToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :lat, :decimal
    add_column :events, :lng, :decimal
  end

  def self.down
    remove_column :events, :lat
    remove_column :events, :lng
  end
end
