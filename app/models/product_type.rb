class ProductType < ActiveRecord::Base
   belongs_to :category, :foreign_key => "leaf_category_id"
   has_many :products
   has_many :accessories, :foreign_key => "accessory_of_id",  :class_name => "Product"
   belongs_to :product_line
end
