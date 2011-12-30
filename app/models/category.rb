class Category < ActiveRecord::Base
   has_many :product_types
   has_many :base_products
   has_many :products
   acts_as_tree
end
