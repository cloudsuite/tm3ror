class CreateProductTypes < ActiveRecord::Migration
  def self.up
       create_table :product_types do |t|
         t.string "category_l1"
         t.string "category_l2"
         t.string "category_l3"
         t.string "leaf_category_id"
         t.string "name"
         t.string "description"

         t.timestamps
       end
  end

  def self.down
    drop_table :product_types
  end
end
