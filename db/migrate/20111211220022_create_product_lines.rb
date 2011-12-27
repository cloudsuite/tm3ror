class CreateProductLines < ActiveRecord::Migration
  def self.up
    create_table :product_lines do |t|
      t.string "name"
      t.string "logomark"
      t.text "description"

      t.timestamps
    end
  end

  def self.down
    drop_table :product_lines
  end
end
