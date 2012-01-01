class Producttypes3 < ActiveRecord::Migration
   def self.up
        drop_table :product_types
        create_table :product_types do |t|
          t.string :category_l1
          t.string :category_l2
          t.string :category_l3
          t.integer :leaf_category_id
          t.string :name
          t.text   :description
          t.string :image_filename

          t.timestamps
        end
   end

   def self.down
     drop_table :product_types
   end
end
