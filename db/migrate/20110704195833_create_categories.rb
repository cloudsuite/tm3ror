class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id
      t.integer :list_order
      t.string :title
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
