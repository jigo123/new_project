class ChangeDatatypesofLatLnginPlaces < ActiveRecord::Migration
  def self.up
    remove_column :places, :lng
    remove_column :places, :lat
    add_column :places, :lat, :decimal
    add_column :places, :lng, :decimal
  end

  def self.down
    remove_column :places, :lng
    remove_column :places, :lat
    add_column :places, :lat, :string
    add_column :places, :lng, :string
  end
end
