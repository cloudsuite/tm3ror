class AccessoriesProductTypes < ActiveRecord::Migration
  def self.up
     drop_table :accessories_product_types
     create_table :accessories_product_types, :id => false do |t|
        t.integer :accesssory_id 
        t.integer :product_type_id
     end
  end

  def self.down
  end
end
