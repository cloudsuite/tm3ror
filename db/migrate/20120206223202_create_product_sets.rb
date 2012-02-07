class CreateProductSets < ActiveRecord::Migration
  def self.up
    create_table :product_sets do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :product_sets
  end
end
