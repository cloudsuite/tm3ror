class LeafCategoriesController < ApplicationController
   
  def display
     # for testing: 9= Modalities/Clinical Electrotheraphy/Ultrasound 
     @category = Category.find_by_id(9)
     @products = Product.where(:category_id => 9)
  end
  
  def  show
       # for testing: 9= Modalities/Clinical Electrotheraphy/Ultrasound 
       @category = Category.find_by_id(9)
       @products = Product.where(:category_id => 9)
  end

end
