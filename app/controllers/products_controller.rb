class ProductsController < ApplicationController
  def show
     @product = Product.find_by_id(params[:id])
     #@product = Product.find_by_id(79)
     @category = @product.category
  end

end
