class BaseProductsChange < ActiveRecord::Migration
  def self.up
      drop_table :base_products
      create_table :base_products do |t|
          t.integer  :category_id
          t.integer  :tms_product_no
          t.string   :image_filename
          t.string   :name
          t.text     :description
          t.text     :long_description
          t.string   :comes_in
          t.string   :comes_in2
          t.string   :sale_units
          t.string   :category_l1
          t.string   :category_l2
          t.string   :category_l3 
          t.integer  :latex_p
          t.integer  :tru_p
          t.integer  :assembly_p
          t.integer  :clinician_only_p
          t.integer  :msds_p
          t.string   :msds_filename

          t.timestamps
        end
  end

  def self.down
  end
end
