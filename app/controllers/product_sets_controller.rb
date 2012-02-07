class ProductSetsController < ApplicationController
   def show
      # test by hardwiring a specific product set and its controller
      # @product_set = BaseProduct.where(:tms_product_no => "720000-000").first
      # Will have to create an entry in products for the product set 720000-000
      # and fill in the foreign key for the two base_products in this set: 720001 and 720002
      @product_set = Product.where(:id => params[:id]).first 
      @category = @product_set.category

      # What url do I use to invoke the show action? 
      # localhost:3000/product_set/3
   end
end
