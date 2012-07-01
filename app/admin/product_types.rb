ActiveAdmin.register ProductType do
   
   menu :priority => 1
   
    scope :not_on_website_yet do | product_types | 
       product_types.where('show_in_llc = 0')
    end        
    scope :missing_image do |product_types|
      product_types.where(:image_filename => "770042-000")
    end
    scope :missing_descriptions do |product_types|
       product_types.where('id > 9999')
    end
    scope :mismatched_category do |product_types|
       product_types.where('id > 9999') 
    end
    
    index do
       column "Rails id",:id
       column "Show in LLC?",:show_in_llc
       #column "TMS Part No",:tms_part_no
       #column :netsuite_item_no
       column :name do |product_type|
          raw(product_type.name)
       end
       column "Category: level-1", :category_l1
       column  "level-2",:category_l2
       column  "level-3",:category_l3

       default_actions
    end

    filter :id
    filter :tms_part_no
    filter :netsuite_item_no 
    filter :name
    filter :category_l1
    filter :category_l2
    filter :category_l3
    
    show do |product_type|
       attributes_table do
          row :id
          row :name do
             raw(product_type.name)
          end         
          row :tms_part_no
          row :netsuite_item_no
          row :sammons_part_no
          row :sammons_category_match
          row :image_filename
          row :image do
              image_tag("/images/products/all_small/" + product_type.image_filename.to_s + ".jpg") 
          end         
          row :category_l1
          row :category_l2
          row :category_l3
   
          row :web_description do
             raw(product_type.web_description)
          end
          row :description do
             raw(product_type.description)
          end
          row :long_description do
             raw(product_type.long_description)
          end
          row :product_line_description do
             raw(product_type.product_line_description)
          end
          row :latex_p do
             if product_type.latex_p == 1 then "yes" else "no" end
          end
          row :tru_p do 
               if product_type.tru_p == 1 then "yes" else "no" end
          end
          row :assembly_p do 
              if product_type.assembly_p == 1 then "yes" else "no" end
          end
          row :clinician_only_p do 
             if product_type.clinician_only_p == 1 then "yes" else "no" end
          end
          row :msds_p do 
              if product_type.msds_p == 1 then "yes" else "no" end
          end
          row :mds_filename
          row :more_info_p do 
              if product_type.more_info_p == 1 then "yes" else "no" end
          end
          row :more_info_filename
          row :method_of_shipment
        end
       active_admin_comments
    end

    
    form do |f|
       f.inputs "Identifiers: Rails, TruMedical, Netsuite, Sammons, ..." do
          f.input :id
          f.input :tms_part_no
          f.input :netsuite_item_no
          f.input :sammons_part_no
          f.input :sammons_category_match
       end
       
       f.inputs "Name, Image Filename, Category path" do
          f.input :name
          f.input :image_filename
          f.input :category_l1
          f.input :category_l2
          f.input :category_l3
       end
       
       f.inputs "Descriptions" do
          f.input :web_description, :input_html => {:rows => 1}
          f.input :description, :input_html => {:rows => 2}
          f.input :long_description, :input_html => {:class => 'tinymceeditor',:rows => 10}
          f.input :product_line_description, :input_html => {:rows => 1}
       end
       
       f.inputs "Other" do
          f.input :latex_p
          f.input :tru_p
          f.input :assembly_p
          f.input :clinician_only_p
          f.input :msds_p
          f.input :mds_filename
          f.input :more_info_p
          f.input :more_info_filename
          f.input :method_of_shipment
       end
      
       f.buttons
      
   end
   
end
