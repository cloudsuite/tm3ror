class ProductType < ActiveRecord::Base
   belongs_to :category
   has_many :products
end
