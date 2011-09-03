class AddMoreRegistrationFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :accept_terms, :integer, :default => 0
    add_column :users, :subscribe_to_announcements, :integer, :default => 0
    add_column :users, :subscribe_to_events, :integer, :default => 0
  end

  def self.down
    remove_column :users, :username
    remove_column :users, :accept_terms
    remove_column :users, :subscribe_to_announcements
    remove_column :users, :subscribe_to_events
  end
end
