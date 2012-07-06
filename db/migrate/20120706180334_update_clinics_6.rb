class UpdateClinics6 < ActiveRecord::Migration
   def self.up
      drop_table :clinics
      create_table :clinics do |t|
         # integer :id  # rails-id supplied by default
         t.integer :netsuite_customer_id # internal to Netsuite
         t.integer :tm_customer_id # visible to TruMedical's customers
         t.string  :name
         t.string  :category # subtypes of clinic:  clinic, hospital, ...
         
         # in alpha/beta test?   
         t.integer :alpha # 1=true
         t.integer :beta # 1= true
         
         # re: clinic administrator
         t.integer :administrator_id # not currently used since administrator type field in user is not yet getting properly set
         t.string  :administrator_name
         t.string  :administrator_email
         t.string  :administrator_password # the plaintext version
         t.string  :administrator_phone
         
         t.string  :sales_rep
         t.string  :primary_contact # now unused: no data; replace by administor reference?
         t.string  :phone
         t.string  :extension # of the primary contact?
         t.string  :email # of the primary contact?
         t.string  :fax
         t.string  :alternate_contact #unused: no data 
         t.string  :office_phone # largely unused: looks like phone is really office_phone  
         t.string  :address    # billing address?
         t.string  :address2
         t.string  :city
         t.string  :state
         t.string  :zip
         t.string  :country
         t.string  :shipping_address_composite
         t.string  :billing_address_composite
         t.string  :terms # Net-30, blank (meaning?) 
         t.string  :price_schedule # enum: Tru-Blu, Corporate 1/2/3, one instance of List, Dealer 1/2
         t.timestamps #26

         # note Clinics also have a one-to-many relationship to Clinicians,
         # and, at this point a one-to-one relationship to a Clinic Administrator. 
         # Possibly a separate one-to-one relationship to a Clinic Owner
         # If we define surrogate classes that shadow the Netsuite classes then 
         # there will be a one-to-one relationship between a clinic and a single Netsuite customer. (Unless we add a bunch of custom record types to Netsuite
     end
  end

  def self.down
  end
end
