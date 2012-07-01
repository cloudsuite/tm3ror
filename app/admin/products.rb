ActiveAdmin.register Product do
    menu false
    
    index do
       column "Rails id",:id
       # column "Show in LLC?",:show_in_llc
       column "TMS Part No",:tms_part_no
       column :netsuite_item_no
       column :name do |product_type|
          raw(product.name)
       end
       column :category # or :category_id? one shows name, one show number? 
       column :product_type
       #column :product_set # products are linked to base_products, not directly to product_sets
       column :base_product
       column :accessory_of
       column "Category: level-1", :category_l1
       column  "level-2",:category_l2
       column  "level-3",:category_l3

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
    
    show do |product|
       attributes_table do
          row :id
          row :type
          row :show_in_llc
          row :category
          #row :product_line
          row :product_type
          #row :product_set # products are linked to base_products and base_products to product_sets
          row :base_product 
          row :base_product_tms_no # redundant; non-normal 
          row :name do
             raw(product.name)
          end         
          row :tms_part_no
          row :netsuite_item_no
          row :sammons_part_no
          row :sammons_category_match
          row :image_filename
          row :image do
              image_tag("/images/products/all_small/" + product.image_filename.to_s + ".jpg") 
          end         
          row :category_l1
          row :category_l2
          row :category_l3
   
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
             case product.latex_p
             when 0 then "no"
             when 1 then "yes"
             else ""
             end
          end
          row :tru_p do |product_type|
               if product.tru_p == 1 then "yes" else "no" end
          end
          row :assembly_p do |product_type|
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
