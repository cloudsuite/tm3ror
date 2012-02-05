class Product < ActiveRecord::Base
      belongs_to :product_type
      belongs_to :category
      belongs_to :base_product
      # belongs_to :accessory_of, :class => "ProductType"
      scope :no_image_yet, where(:image_filename => nil)
end
