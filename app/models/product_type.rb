class ProductType < Product
   belongs_to :product_line
   has_many :products # simple_products? 
   #has_many :accessories, :foreign_key => "accessory_of_id",  :class_name => "Product"
   has_and_belongs_to_many :accessories
end
