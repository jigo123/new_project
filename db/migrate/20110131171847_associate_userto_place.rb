class AssociateUsertoPlace < ActiveRecord::Migration
  def self.up
    add_column :users, :place_id, :integer
  end

  def self.down
    remove_column :users, :place_id
  end
end
