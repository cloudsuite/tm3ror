class CategoriesController < ApplicationController
   
  def display
     @category = Category.find_by_id(params[:id])
  end

   def show
      @category = Category.find_by_id(params[:id])
   end
end
