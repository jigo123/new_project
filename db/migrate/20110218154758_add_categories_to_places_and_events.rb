class AddCategoriesToPlacesAndEvents < ActiveRecord::Migration
  def self.up
    add_column :places, :category, :string
    add_column :events, :category, :string
  end

  def self.down
    remove_column :places, :category
    remove_column :events, :category
  end
end
