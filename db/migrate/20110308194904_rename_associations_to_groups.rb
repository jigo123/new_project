class RenameAssociationsToGroups < ActiveRecord::Migration
  def self.up
    add_column :users, :groups, :text
    remove_column :users, :associations
  end

  def self.down
    add_column :users, :associations, :text
    remove_column :users, :groups
  end
end
