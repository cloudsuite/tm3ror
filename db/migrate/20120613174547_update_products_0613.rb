class UpdateProducts0613 < ActiveRecord::Migration

  def self.up
       drop_table :products
         create_table :products do |t|
            t.string   "type"
            t.integer  "show_in_llc"
            t.integer  "category_id"
            t.integer  "product_type_id"
            t.integer  "product_line_id"
            t.integer  "accessory_of_id"
            t.integer  "product_set_id"
            t.integer  "base_product_id"
            t.string   "base_product_tms_no"
            t.string   "tms_part_no"
            t.string   "netsuite_item_no"
            t.string   "sammons_part_no"
            t.string   "sammons_category_match"
            t.integer  "is_accessory_p"
            t.integer  "accessory_for"
            t.string   "image_filename"
            t.string   "name"
            t.text     "web_description"
            t.text     "description"
            t.text     "long_description"
            t.text     "product_line_description"
            t.string   "sale_units"
            t.string   "category_l1"
            t.string   "category_l2"
            t.string   "category_l3"
            t.integer  "latex_p"
            t.integer  "tru_p"
            t.integer  "assembly_p"
            t.integer  "clinician_only_p"
            t.integer   "available_to_dealers_p"
            t.integer  "msds_p"
            t.string   "mds_filename"
            t.integer  "more_info_p"
            t.string   "more_info_filename"
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
