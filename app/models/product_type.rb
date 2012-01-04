class ProductType < ActiveRecord::Base
   belongs_to :category #, :foreign_key => "leaf_category_id"
   belongs_to :product_line
   has_many :products
   #has_many :accessories, :foreign_key => "accessory_of_id",  :class_name => "Product"
   has_and_belongs_to_many :accessories
end
