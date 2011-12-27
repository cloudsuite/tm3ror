class CreateProductSets < ActiveRecord::Migration
  def self.up
    create_table :product_sets do |t|
      t.integer :tms_product_no
      t.string :name
      t.text :description
      t.string :image_filename

      t.timestamps
    end
  end

  def self.down
    drop_table :product_sets
  end
end
