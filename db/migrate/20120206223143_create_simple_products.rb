class CreateSimpleProducts < ActiveRecord::Migration
  def self.up
    create_table :simple_products do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :simple_products
  end
end
