class BaseProductsController < ApplicationController
  
# Make sure this is pulling objects out of 'products' table using STI 
# rather than out of what was originally a separate base_products table. 
   
  def show
     # test by hardwiring a specific base product and its controller
     # @base_product = BaseProduct.where(:tms_product_no => "710060-000").first
     @base_product = BaseProduct.where(:id => params[:id]).first 
     @category = @base_product.category
         
     # What url do I use to invoke the show action? 
     # localhost:3000/base_products/3
  end

end
