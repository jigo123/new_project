class AddPropertiesToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :logo_file_name, :string
    add_column :events, :logo_content_type, :string
    add_column :events, :logo_file_size, :integer
    add_column :events, :logo_updated_at, :datetime
    add_column :events, :url, :string
    add_column :events, :phone, :string
    add_column :events, :email, :string
    add_column :events, :description, :text
    add_column :events, :organizer, :integer, :default => 0
  end

  def self.down
    remove_column :events, :logo_file_name
    remove_column :events, :logo_content_type
    remove_column :events, :logo_file_size
    remove_column :events, :logo_updated_at
    remove_column :events, :url
    remove_column :events, :phone
    remove_column :events, :email
    remove_column :events, :description
    remove_column :events, :organizer
  end
end
