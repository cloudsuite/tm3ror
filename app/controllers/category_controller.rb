class CategoryController < ApplicationController
   
  def display
     # for testing: 9= Modalities/Clinical Electrotheraphy/Ultrasound 
     @products = Product.where(:category_id => 9)
  end

end
