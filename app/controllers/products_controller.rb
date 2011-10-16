class ProductsController < ApplicationController
   
  def show
     @product = Product.find_by_id(19) # replace with params[:id]
     @category = @product.category
  end

end
