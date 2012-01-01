# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111231220009) do

  create_table "base_products", :force => true do |t|
    t.integer  "category_id"
    t.integer  "tms_product_no"
    t.string   "image_filename"
    t.string   "name"
    t.text     "description"
    t.text     "long_description"
    t.string   "comes_in"
    t.string   "comes_in2"
    t.string   "sale_units"
    t.string   "category_l1"
    t.string   "category_l2"
    t.string   "category_l3"
    t.integer  "latex_p"
    t.integer  "tru_p"
    t.integer  "assembly_p"
    t.integer  "clinician_only_p"
    t.integer  "msds_p"
    t.string   "msds_filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "level"
    t.string   "tree_path"
    t.string   "name"
    t.string   "color"
    t.integer  "list_order"
    t.integer  "has_product_types_p"
    t.string   "title"
    t.string   "description"
    t.string   "image_filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name"
    t.string   "logomark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_lines", :force => true do |t|
    t.integer  "manufacturer_id"
    t.string   "name"
    t.string   "logomark"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", :force => true do |t|
    t.integer  "product_line_id"
    t.string   "category_l1"
    t.string   "category_l2"
    t.string   "category_l3"
    t.integer  "leaf_category_id"
    t.string   "name"
    t.text     "description"
    t.string   "image_filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.integer  "product_type_id"
    t.integer  "accessory_of_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.integer  "type_of_request"
    t.integer  "number_of_catelogs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "phone_number"
    t.integer  "wants_n_catelogs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
