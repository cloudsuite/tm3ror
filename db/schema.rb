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

ActiveRecord::Schema.define(:version => 20111016042045) do

  create_table "categories", :force => true do |t|
    t.integer  "parent_id"
    t.string   "tree_path"
    t.string   "name"
    t.string   "color"
    t.integer  "list_order"
    t.string   "title"
    t.string   "description"
    t.string   "image_filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.string   "netsuite_id"
    t.string   "tms_part_no"
    t.string   "sammons_part_no"
    t.string   "sammons_category_match"
    t.string   "image_filename"
    t.string   "name"
    t.string   "description"
    t.string   "long_description"
    t.string   "xlong_description"
    t.string   "sale_units"
    t.string   "category_l1"
    t.string   "category_l2"
    t.string   "category_l3"
    t.integer  "latex_p"
    t.integer  "tru_p"
    t.integer  "assembly_p"
    t.integer  "clinician_only_p"
    t.integer  "msds_p"
    t.integer  "more_info_p"
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

  create_table "users", :force => true do |t|
    t.string   "name_last"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
