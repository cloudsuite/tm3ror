class BaseProductsController < ApplicationController
   
  def show
     # test by hardwiring a specific base product and its controller
     @base_product = BaseProduct.where(:tms_product_no => "710060-000").first
     # or:  @base_product = BaseProduct.where(:id => 3) 
     @category = @base_product.category
     
     # What url do I use to invoke the show action? 
     # localhost:3000/base_products/3
  end

end
