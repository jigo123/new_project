class AddIndustryToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :industry, :string
  end

  def self.down
    remove_column :events, :industry
  end
end