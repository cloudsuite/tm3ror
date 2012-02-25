class ProductsController < ApplicationController
   
  def show
     @product = Product.find_by_id(params[:id])
     #@product = Product.find_by_id(79)
     @category = @product.category
  end
  
  def search
      # Can I move the first line out and retain only the 2nd and 3rd? No. 
      # If do so then the Search fails on an undefined reference to an attribute for NilClass
      # Why? 
      @product = Product.find_by_id(1)
      @search = Product.search(params[:search]) # is this function defined by ActiveRecord or Metasearch? 
      # filter @search to the single base-product as follows: 
      # If the base-product is an immediate member of a category, call base_products/show passing in the base-product-id ( = the rails id of the object representing this base-product)
      # If the base-product is a member of a product-set, call product_sets/show passing in the product_set_id (= the rails id of the tuple representing that product-set)  
      # or, in the case of a base-product which is part of a product-set, the single product set
      # Then call either base_products/show or product_sets/show (or product_types/show 
      # Expand this to handle complex products (product_types) as well. 
      
      # Alternate solution is to add a 'show_in_llc' column to products,and then, 
      # when searching for all of the products in a category, 
      # find category.products.where("show_in_llc" = "true") 
      # — assuming that you can paste a where clause onto category.products like this.
      # And store a category_id for all simple products, not just those that are direct members of a leaf-level category without an intervening base-product or product-set/base-product pair. 
      
      @products = @search.all # .page(params[:page]).per(7)
      # problem: if some of these products are associated with a base-product, then they're category_id field is going to be nil, and that will foul up the breadcrumb that I have added to the top of the products page. Workaround: Remove that for now. 
      # still a problem: returning both the baseproduct and the simpleproducts associated with it because I copied all of the fields from the first simple-product in the product-set associated with a base-product into the tuple for the base-product? 
      # 3rd problem ( adumbrated by the commented out pagination above):  if Product.search(params[:search]) returns more products than will fit on a single page, they are not being paginated, nor is there any way of scrolling the page down to see all of them. 
      respond_to do |format|
        format.html # invokes views/products/search.html.erb
      end
   end

end
