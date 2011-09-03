class AddProducerNameToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :producer_name, :string
  end

  def self.down
    remove_column :events, :producer_name
  end
end
