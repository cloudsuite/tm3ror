class BaseProduct < Product
   has_many :simple_products # e.g., products with specific size and color
   belongs_to :product_set
end
