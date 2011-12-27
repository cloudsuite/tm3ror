class ProductLine < ActiveRecord::Base
   belongs_to :manufacturer
   has_many :product_types
end
