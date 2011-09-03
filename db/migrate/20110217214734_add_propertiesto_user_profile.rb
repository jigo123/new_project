class AddPropertiestoUserProfile < ActiveRecord::Migration
  def self.up
    add_column :users, :headline, :string
    add_column :users, :location, :string
    add_column :users, :bio, :text
    add_column :users, :phone, :string
    add_column :users, :url, :string
  end

  def self.down
    remove_column :users, :headline
    remove_column :users, :location
    remove_column :users, :bio
    remove_column :users, :phone
    remove_column :users, :url
  end
end
