class LeafCategoriesController < ApplicationController
   
  def display
     # for testing a leaf category that has product_types and products 9= Modalities/Clinical Electrotheraphy/Ultrasound 
     @category = Category.find_by_id(9)
     @products = Product.where(:category_id => 9)
  end
  
  def  show
       # for testing a leaf category with only products  7= Modalities/Clinical Electrotheraphy/Lotions & Gels
       @category = Category.find_by_id(7)
       @products = Product.where(:category_id => 7)
  end

end
