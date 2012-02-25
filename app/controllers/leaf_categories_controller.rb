class LeafCategoriesController < ApplicationController
   
  def display
     # for testing a leaf category that has product_types and products 9= Modalities/Clinical Electrotheraphy/Ultrasound 
     @category = Category.find_by_id(9)
     @products = Product.where(:category_id => 9)
  end
  
  def  show
       # for testing a leaf category with only products  7= Modalities/Clinical Electrotheraphy/Lotions & Gels
       # decide whether this leaf-level category has product_types, base_products, or directly points to products.  
       # Is is possible for a leaf-level category to have more than one?  Assume yes. 
       # We want to pass to leaf_categories#show an array [ ] of (product-id, product-type) pairs, where
       # product-type is 1,2,or 3 corresponding to product_types, base_products, products 
       # We have to avoid finding all of the products for a product-type or base-product though. 
       # In the case of a base-product, we just want one block in the leaf-level category that, when you 
       # click on it, goes to a page that shows all of the products within this base-product. 
       
       # use 7 for simple products, 3 for matrix products, 9 for complex products 
       
       @category = Category.find_by_id(params[:id])
      
  end

end
