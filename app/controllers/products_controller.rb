class ProductsController < ApplicationController
   
  def show
     @product = Product.find_by_id(params[:id])
     #@product = Product.find_by_id(79)
     @category = @product.category
  end
  
  def search
      # Can I move the first line out and retain only the 2nd and 3rd? No. 
      # If do so then the Search fails on an undefined reference to an attribute for NilClass 
      @product = Product.find_by_id(1)
      @search = Product.search(params[:search])
      @products = @search.all # .page(params[:page]).per(7)
      respond_to do |format|
        format.html # invokes views/products/search.html.erb
      end
   end

end
