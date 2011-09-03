class AddProfileCompletedBitToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :profile_completed, :integer, :default => 0
  end

  def self.down
    remove_column :users, :profile_completed
  end
end
