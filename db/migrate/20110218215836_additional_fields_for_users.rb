class AdditionalFieldsForUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :company, :string
    add_column :users, :title, :string
    add_column :users, :school, :string
    add_column :users, :graduation_year, :string
    add_column :users, :major, :string
    add_column :users, :associations, :text
    add_column :users, :interests, :text
    add_column :users, :hometown_city, :string
    add_column :users, :hometown_state, :string
  end

  def self.down
    remove_column :users, :company
    remove_column :users, :title
    remove_column :users, :school
    remove_column :users, :graduation_year
    remove_column :users, :major
    remove_column :users, :associations
    remove_column :users, :interests
    remove_column :users, :hometown_city
    remove_column :users, :hometown_state
  end
end
