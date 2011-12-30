class CreateBaseProduct < ActiveRecord::Migration
  def self.up
     create_table :base_products do |t|
        t.integer :tms_product_no
        t.string  :name
        t.text    :description
        t.text    :long_description
        t.string  :image_filename
        t.string  :comes_in
        t.string  :comes_in2
        t.integer :latex_p
        t.integer :tru_p
        t.integer :clinician_only_p
        t.integer :msds_p

        t.timestamps
      end
  end

  def self.down
  end
end
