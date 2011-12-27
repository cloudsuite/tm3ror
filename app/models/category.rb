class Category < ActiveRecord::Base
   has_many :products
   has_many :product_types
   acts_as_tree
end
