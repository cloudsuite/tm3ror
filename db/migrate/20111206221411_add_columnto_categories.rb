class AddColumntoCategories < ActiveRecord::Migration
  def self.up
     drop_table :categories
      create_table :categories do |t|
        t.integer :parent_id
        t.integer :level
        t.string :tree_path
        t.string :name
        t.string :color
        t.integer :list_order
        t.string :title
        t.string :description
        t.string :image_filename

        t.timestamps
     end
  end

  def self.down
  end
end
