ActiveAdmin.register SimpleProduct do
   
  menu :priority => 4
  # place scopes for data QA here
  index do
      column "Rails id",:id
      column "Show in LLC?",:show_in_llc do
          if :show_in_llc == 1 then "yes" else "no" end
       end
      column "TMS Part No",:tms_part_no
      column "NS Item No",:netsuite_item_no   
      column :base_product do |simple_product|
         raw(simple_product.base_product_id) 
      end
      column :product_type # relevant? 
      #column :product_set # products are linked to base_products, not directly to product_sets
      column "Category: level-1", :category_l1
      column  "level-2",:category_l2
      column  "level-3",:category_l3
      column :category # or :category_id? one shows name, one show number? 
      column :name do |simple_product|
            raw(simple_product.name) # for those with link to base_product, does name of simple_product match those of base_product? 
      end
      #column :accessory_of # why getting 'undefined method 'accessory_of' for SimpleProduct but not other subtypes of Product

      default_actions
   end

   filter :id
   filter :tms_part_no
   filter :netsuite_item_no 
   filter :name
   filter :product_type # w/name it puts in pull down menu? with _id it puts type-in field? 
   filter :product_set
   filter :base_product
   filter :accessory_of
   filter :category_l1
   filter :category_l2
   filter :category_l3
   filter :category # get pull-down menu
   
   show do |product|
      attributes_table do
         row :id
         row :type # should always be 'SimpleProduct' 
         row :show_in_llc      
         #row :show_in_llc do
         #   if product.show_in_llc == 1 then "yes" else "no" end
         #  end
         #row :product_line
         row :product_type
         #row :product_set # products are linked to base_products and base_products to product_sets
         row :base_product do
            if product.base_product_id then 
               raw(product.base_product.name)
            else ""
            end
           end 
         row :base_product_tms_no # redundant; non-normal 
         row :name do
            raw(product.name)
           end         
         row :tms_part_no
         row :netsuite_item_no
         row :sammons_part_no
         row :sammons_category_match
         # Should (now) have image only if not part of a base_product
         row :image_filename
         row :image do
             image_tag("/images/products/all_small/" + product.image_filename.to_s + ".jpg") 
           end         
         row :category_l1
         row :category_l2
         row :category_l3
         row :category # should always match category_l3
  
         row :web_description do
            raw(product.web_description)
           end
         row :description do
            raw(product.description)
           end
         row :long_description do
            raw(product.long_description)
           end
         row :product_line_description do
            raw(product.product_line_description)
           end
         
         row :sale_units
         
         row :latex_p do 
             if product.latex_p == 1 then "yes" else "no" end
            end
         row :tru_p do 
             if product.tru_p == 1 then "yes" else "no" end
            end
         row :assembly_p do 
             if product.assembly_p == 1 then "yes" else "no" end
            end
         row :clinician_only_p do 
            if product.clinician_only_p == 1 then "yes" else "no" end
            end
         row :msds_p do 
             if product.msds_p == 1 then "yes" else "no" end
            end
         row :mds_filename
         row :more_info_p do 
             if product.more_info_p == 1 then "yes" else "no" end
            end
         row :more_info_filename
         row :price_clinic_list do 
             number_to_currency(product.price_clinic_list)
            end
         row :price_tru_blue do 
             number_to_currency(product.price_tru_blue)
            end
         row :price_deviation_floor do 
             number_to_currency(product.price_deviation_floor)
            end
         row :price_corporate_2 do 
             number_to_currency(product.price_corporate_2)
            end
         row :price_corporate_3 do 
             number_to_currency(product.price_corporate_3)
            end
         row :price_dealer_1 do 
              number_to_currency(product.price_dealer_1)
            end
         row :price_dealer_2 do 
              number_to_currency(product.price_dealer_2)
            end
         row :price_dealer_3 do 
              number_to_currency(product.price_dealer_3)
            end

         row :method_of_shipment
       end
      active_admin_comments
   end
end
