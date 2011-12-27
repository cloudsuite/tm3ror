class ProductTypesController < ApplicationController
   
  def show
     # test 1 
     # Get record for Intelect Transport Electrotherapy unit 
     # This product_type has a single product:  710031-001, a 2-channel unit
     
     # test 2
     # Get record for Intellect Transport Ultrasound
     # This product type has 4 products:
     #   710032-001 w/1cm applicator
     #   710032-002 w/2cm applicator
     #   710032-005 w/5cm applicator
     #   710032-010 w/10cm applicator  
     # It also has a set of assessories — some of them (cart, battery pack, carry bag) are the same
     # as those for the Intelect Transport Electrotherapy and Combo units;  others are unique
     # to the Ultrasound unit — the 4 different applicator sizes; if user buys the unit with one
     # applicator size, he can also buy applicators in other sizes.  
     # Note that the applicators are Accessories to both the Ultrasound unit and the Combo Unit. 
     # For now, just repeat all of them as accessories on the Product Type.  Don't try to model
     # accessories for the Product Group.  
     # Is this the terminology we want to use: Product_type and Product?  'Product Type' is confusing
     # for people. How about 
     #   Product-Line (Intelec Transport)  
     #   Product (Intelec Transport Electrotheraphy, IT Ultrasound, IT Combo Unit )
     #   Model (for IT Ultrasound: 710032-001 through 71-0032-010: one for each of the different applicator sizes)
     #   Products would then have Accessories.  
     # How would the category tree work with this? 
     # Entries in the leaf-level category page would point to what? Products?  
     # to the 'ultrasound' entry in the leaf-level category page modalities/electrotherapy/ultrasound would 
     # contain references to ultrasound products from different manufacturers and/or different lines made by 
     # the same manufacturer  ( in chattanooga's case: ultrasound units from the three lines: 
     # Intelec Legend, Intelec Transport, and Intelec Legend XT.        
     
     @product_type = ProductType.find_by_id(19) # replace with params[:id]
     
     @products = @product_type.products
     @category = @product_type.category
     # renders view/product_types/show.html.erb by default
  end
  
  def search
     # @product = Product.where(:sammons_part_no => params[:id]).first 
     # if nothing matches the part number ... 
     # if it does, then redirect to Product#show
  end

end
