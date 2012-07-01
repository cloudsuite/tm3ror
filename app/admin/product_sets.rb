ActiveAdmin.register ProductSet do
   
    menu :priority => 2
    
    index do
       column "Rails id",:id
       column "Show in LLC?",:show_in_llc 
       #column "TMS Part No",:tms_part_no # relevant? do product-sets have part_nos?
       #column :netsuite_item_no # relevant? drop

       #column :product_type
       #column :product_set
       #column :base_product # what if leave the 1 side of a 1:n in here? error
       #column :accessory_of
       column "Category:level-1", :category_l1
       column  "level-2",:category_l2
       column  "level-3",:category_l3
       column :category # or :category_id? one shows name, one show number? 
       column :name do |product_set|
          raw(product_set.name)
       end
       default_actions
    end

    filter :id
    #filter :tms_part_no # relevant?
    #filter :netsuite_item_no # relevant? 
    filter :name
    filter :category_l1
    filter :category_l2
    filter :category_l3
    filter :category
    
    show do |product_set|
       attributes_table do
          row :id
          row :type # should always be 'ProductSet'
          row :show_in_llc do  # should always be 1=yes
                if product_set.show_in_llc == 1 then "yes" else "no" end
          end
          #row :category # moved below
          #row :product_line
          row :name do
             raw(product_set.name)
          end         
          #row :tms_part_no # relevant? cut?
          #row :netsuite_item_no # relevant? cut?
          row :sammons_part_no # relevant? 
          row :sammons_category_match # relevant?
          row :image_filename
          row :image do
              image_tag("/images/products/all_small/" + product_set.image_filename.to_s + ".jpg") 
          end         
          row :category_l1
          row :category_l2
          row :category_l3
          row :category # should match category_l3 above
   
          row :web_description do
             raw(product_set.web_description)
          end
          row :description do
             raw(product_set.description)
          end
          row :long_description do
             raw(product_set.long_description)
          end
          #row :product_line_description do
          #   raw(product_set.product_line_description)
          #end
          
          # How many (if any) of the following properties are relevant to product-sets? Cut the others
          row :latex_p do # relevant? 
             case product_set.latex_p
             when 0 then "no"
             when 1 then "yes"
             else ""
             end
          end
          row :tru_p do 
               if product_set.tru_p == 1 then "yes" else "no" end
          end
          row :assembly_p do # relevant?
              if product_set.assembly_p == 1 then "yes" else "no" end
          end
          row :clinician_only_p do 
             if product_set.clinician_only_p == 1 then "yes" else "no" end
          end
          row :msds_p do 
              if product_set.msds_p == 1 then "yes" else "no" end
          end
          row :mds_filename
          row :more_info_p do 
              if product_set.more_info_p == 1 then "yes" else "no" end
          end
          row :more_info_filename
          
          # product_sets don't have prices: cut all of this? They are in the database, but only because copied from product listing below. Confirm that they are not defined on the product_set and inherited by base_products and (through them) by products. 


          row :method_of_shipment
        end
       active_admin_comments
    end
end
