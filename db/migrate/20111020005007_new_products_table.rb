class NewProductsTable < ActiveRecord::Migration
  def self.up
     drop_table :products
      create_table :products, :force => true do |t|
        t.integer  "product_type_id"
        t.string   "tms_part_type_no"
        t.string   "accessory_for"
        t.string   "tms_part_no"
        t.string   "name"
        t.string   "sale_units"
        t.integer  "latex_p"
        t.integer  "tru_p"
        t.integer  "assembly_p"
        t.integer  "clinician_only_p"
        t.integer  "msds_p"
        t.integer  "msds_filename"
        t.string   "method_of_shipment"
        t.decimal  "price_clinic_list"
        t.decimal  "price_tru_blue"
        t.decimal  "price_deviation_floor"
        t.decimal  "price_corporate_2"
        t.decimal  "price_corporate_3"
        t.decimal  "price_dealer_1"
        t.decimal  "price_dealer_2"
        t.decimal  "price_dealer_3"
        t.timestamps
      end
  end

  def self.down
  end
end
