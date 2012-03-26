class ProductsController < ApplicationController
   
  def show
     @product = Product.find_by_id(params[:id])
     #@product = Product.find_by_id(79)
     @category = @product.category
  end
  
  def search
      # Can I move the first line out and retain only the 2nd and 3rd? No. 
      # If do so then the Search fails on an undefined reference to an attribute for NilClass. Why? Not used in Railscast on metasearch. 
      @product = Product.find_by_id(1)
      @search = Product.search(params[:search]) # search function defined by Metasearch 
      @products = @search.all # .page(params[:page]).per(7)
      
      # Rewrite this so that it calls view/products/show.html.erb only for simple products that match the sammons part#, and calls base-product, product-set, or product-type for those that are members of product-sets or product-types  ( or directly of the implicit product-set in base-products ) .  Maybe use the search_controller instead of the the products_controller?  The products controller is implicitly for simple products. There are other controllers for base_products, product_sets and product_types.  It would be asymmetrical to put the logic for returning results from a competitive part number search into the products controller and not into any of the others.
      # Currently this is being handled in views/products/search.html.erb: 
      # It determines whether it is being asked to display a simple-product, base-product, product-set, or product-type and invokes the correct controller/action.  
      
      # filter @search to the single base-product as follows: 
      # If the base-product is an immediate member of a category, call base_products/show passing in the base-product-id ( = the rails id of the object representing this base-product)
      # If the base-product is a member of a product-set, call product_sets/show passing in the product_set_id (= the rails id of the tuple representing that product-set)  
      # or, in the case of a base-product which is part of a product-set, the single product set
      # Then call either base_products/show or product_sets/show (or product_types/show 
      # Expand this to handle complex products (product_types) as well. 
      
      # Alternate solution is to add a 'show_in_llc' column to products,and 
      # store a category_id for all simple products, not just those that are direct members of a leaf-level category without an intervening base-product or product-set/base-product pair as we do now.  
      # When searching for all of the products in a category for the main (left) navigation, find category.products.where("show_in_llc" = "true") 
      # — assuming that you can paste a where clause onto category.products like this. 
      
 
      # problem: if some of these products are associated with a base-product, then they're category_id field is going to be nil, and that will foul up the breadcrumb that I have added to the top of the products page. Workaround: Remove the breadcrumb from the  products page template for now. 
      # still a problem: returning both the base-product and the simple-products associated with it because I copied all of the fields from the first simple-product in the product-set associated with a base-product into the tuple for the base-product — including the sammons part number.
      # 3rd problem ( adumbrated by the commented out pagination above):  if Product.search(params[:search]) returns more products than will fit on a single page, they are not being paginated, nor is there any way of scrolling the page down to see all of them. [ 3/23: the latter should no longer be true; you should be able to scroll down a long page of results. ] 
      respond_to do |format|
        format.html # invokes views/products/search.html.erb
      end
   end

end
