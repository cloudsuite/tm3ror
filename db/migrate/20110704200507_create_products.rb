class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table "products", :force => true do |t|
      t.integer  "category_id"
      t.string   "netsuite_id"
      t.string   "tms_part_no"
      t.string   "image_url"
      t.string   "sammons_part_no"
      t.string   "sammons_match"
      t.string   "description"
      t.string   "header"
      t.string   "sale_units"
      t.string   "category_l1"
      t.string   "category_l2"
      t.string   "category_l3"
      t.string   "ship_via"
      t.decimal  "cost"
      t.decimal  "price_web"
      t.decimal  "price_clinic"
      t.decimal  "price_trueblue"
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
