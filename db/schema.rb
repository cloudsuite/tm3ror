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

ActiveRecord::Schema.define(:version => 20110704200507) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "list_order"
    t.string   "title"
    t.string   "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
