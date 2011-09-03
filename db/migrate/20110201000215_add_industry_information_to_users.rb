class AddIndustryInformationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :industry, :integer
    add_column :users, :industry_interested_1, :integer
    add_column :users, :industry_interested_2, :integer
    add_column :users, :industry_interested_3, :integer
  end

  def self.down
    remove_column :users, :industry
    remove_column :users, :industry_interested_1
    remove_column :users, :industry_interested_2
    remove_column :users, :industry_interested_3
  end
end
