ActiveAdmin.register Product do
   scope :no_image_yet
  index do 
     column :tms_part_no
     column :name do |product|
        raw(product.name)
     end
     column :description do |product|
        raw(product.description)
     end
     column :image_filename
     column :category
     column :price_clinic_list do |product|
        div :class=>"price" do
           number_to_currency product.price_clinic_list
        end
     end
     default_actions
  end
end
