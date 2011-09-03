class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :href
      t.string :postcode
      t.string :owner
      t.string :uuid

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
