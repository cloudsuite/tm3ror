ActiveAdmin.register Clinic do

   index do
       
       column "TMS Id", :tm_customer_id
       column "NS Id", :netsuite_customer_id
       column "Rails Id",:id
       column "Name", :name
       column "Type", :category
       column "Administrator", :primary_contact
       column "phone", :phone
       column "Price Schedule", :price_schedule
       column "Terms", :terms
       default_actions
    end

    filter :name
    filter :category
    filter :tm_customer_id
    filter :netsuite_customer_id
    filter :id
    
   form do |f|
      f.inputs "Clinic" do
         f.input :name, :input_html => {:size => '30'}
         f.input :category, :as=>:select, :collection=> ["Clinic", "Home Health", "Hospital", "Spa/Gym", "Educational", "Government", "Vendor", "Insurance", "Pharmacy", "Long Term Care", "Chiropractor", "Physician", "Podiatrist","Other"]
         f.input :tm_customer_id, :label => "Tru Medical Customer Id",:input_html => { :readonly => true } 
         f.input :netsuite_customer_id, :label=>"Netsuite internal customer id",:input_html => { :readonly => true }
         f.input :id, :label=>"Rails internal customer id",:input_html => { :readonly => true }      
      end
      f.inputs "Administrator" do
        f.input :primary_contact, :label => "Administrator"
        f.input :email 
        f.input :phone
        f.input :extension
        f.input :fax

      end
      f.inputs "Price Schedule" do
        f.input :price_schedule, :as => :radio, :collection => ["clinic-list", "tru-blu", "corporate-2","corporate-3", "dealer-1", "dealer-2", "dealer-3"]
        f.input :terms, :as => :radio, :collection => ["Net-30","2% 10, Net 30", "Due on Receipt"]
      end
      f.inputs "Billing Address" do
        f.input :address
        f.input :address2
        f.input :city
        f.input :state
        f.input :zip
      end
      f.inputs "Shipping Address" do
        f.input :shipping_address_composite, :label => "Shipping Address"
      end
      f.buttons
    end


end
