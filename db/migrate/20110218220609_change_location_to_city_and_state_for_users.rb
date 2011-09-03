class ChangeLocationToCityAndStateForUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :location
    add_column :users, :location_city, :string
    add_column :users, :location_state, :string
  end

  def self.down
    add_column :users, :location, :string
    remove_column :users, :location_city
    remove_column :users, :location_state
  end
end
