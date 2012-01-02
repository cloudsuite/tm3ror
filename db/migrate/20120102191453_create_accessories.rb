class CreateAccessories < ActiveRecord::Migration
  def self.up
     
    create_table :accessories do |t|
            t.integer  "category_id"
            t.integer  "product_type_id"  # unused in this table
                           # Used in 'products' table as foreign key for
                           # the product_type of which this product is a model; 
                           # Rename it 'model_of_id' there and add the foreign key declaration necessay to make it work in the apt.products association 
            t.integer  "accessory_of_id"  # unused in this table          
            t.integer  "base_product_id"  # unused in this table; "
            t.string   "base_product_tms_no" # unused in this table; "       
            t.string   "tms_part_no"
            t.string   "netsuite_item_no"        
            t.string   "sammons_part_no"
            t.string   "sammons_category_match"
            t.integer  "is_accessory_p" # should be 1 (for true) 
            t.integer  "accessory_for" # unused, here or in products; forgot it was there
               # and added another field 'accessory_of-id' above ) 
            t.string   "image_filename"
            t.string   "name"
            t.text     "description"
            t.text     "long_description"
            t.text     "product_line_description" # can be removed, here and in 'products' table; it is now in a separate product_line table
            
            t.string   "sale_units"
            t.string   "category_l1"
            t.string   "category_l2"
            t.string   "category_l3"
            t.integer  "latex_p"
            t.integer  "tru_p"
            t.integer  "assembly_p"
            t.integer  "clinician_only_p"
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
    drop_table :accessories
  end
end
