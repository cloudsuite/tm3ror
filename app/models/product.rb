class Product < ActiveRecord::Base
      belongs_to :product_type
      belongs_to :category
      belongs_to :product_set
end
