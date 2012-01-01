class AddFKtoManufacturerToProductLine < ActiveRecord::Migration
  def self.up
     drop_table :product_lines
     create_table :product_lines do |t|
       t.integer "manufacturer_id"
       t.string "name"
       t.string "logomark"
       t.text "description"

       t.timestamps
     end
  end

  def self.down
  end
end
