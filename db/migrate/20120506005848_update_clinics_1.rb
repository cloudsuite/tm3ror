class UpdateClinics1 < ActiveRecord::Migration
  def self.up
     drop_table :clinics
     create_table :clinics do |t|
        t.string :name
        t.integer :tm_customer_id # visible to TruMedical's customers
         # Note that in TruMedical's current implementation of Netsuite, 
         # in the case of clinics, it is the clinic that is the 'customer', not the individual clinicians associated with that clinic. 
         # Clinicians are essentially singing into the clinic's account. 
         # Why do we have them sign in as different 'users'? To track who was responsible for different parts of what the clinic bought?  
        t.integer :netsuite_customer_id # internal to Netsuite
        t.string :street
        t.string :street2
        t.string :city
        t.string :state
        t.string :zip
        t.string :url
        t.string :billing_email
        t.string :phone
        t.string :extension
        t.string :price_schedule

        t.timestamps
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
