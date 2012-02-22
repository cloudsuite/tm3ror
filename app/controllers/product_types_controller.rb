class ProductTypesController < ApplicationController
   
  def show
    
     # Will this continue to work against STI using Products class? 
     # No; must do Product.find_by ... rather than ProductType.find_by ... 
     
     # @product_type = Product.find_by_id(params[:id]) # replace with params[:id]
     @product_type = Product.where(:id => params[:id]).first # this from product_sets.controller.rb
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
