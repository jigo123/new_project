class AddIndexToPlaceAssociation < ActiveRecord::Migration
  def self.up
    add_index :users, :place_id
  end

  def self.down
    remove_index :users, :place_id
  end
end
