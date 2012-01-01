class ProductTypesController < ApplicationController
   
  def show
    
     
     @product_type = ProductType.find_by_id(params[:id]) # replace with params[:id]
     
     @products = @product_type.products
     @category = @product_type.category
     @accessories = @product_type.accessories
     # Renders view/product_types/show.html.erb by default
  end
  
  def search
     # @product = Product.where(:sammons_part_no => params[:id]).first 
     # if nothing matches the part number ... 
     # if it does, then redirect to Product#show
  end

end
