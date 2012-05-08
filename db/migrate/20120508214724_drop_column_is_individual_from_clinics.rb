class DropColumnIsIndividualFromClinics < ActiveRecord::Migration
  def self.up
     drop_table :clinics
        create_table :clinics do |t|
           # integer :id  # rails-id supplied by default
           t.integer :netsuite_customer_id # internal to Netsuite
           t.integer :tm_customer_id # visible to TruMedical's customers
            # Note that in TruMedical's current implementation of Netsuite, 
            # in the case of clinics, it is the clinic that is the 'customer', not the individual clinicians associated with that clinic. 
            # Clinicians are essentially singing into the clinic's account. 
            # Why do we have them sign in as different 'users'? To track who was responsible for different parts of what the clinic bought?  
           t.string :name
           t.string :category # subtypes of clinic:  clinic, hospital, ... 
           t.string :sales_rep
           t.string :primary_contact # now unused: no data; replace by administor reference?
           t.string :phone
            t.string :extension # of the administrator?  redundant with same info in administrator record
            t.string :email
            t.string :fax
            t.string :alternate_contact #unused: no data 
            t.string :office_phone # largely unused: looks like phone is really office_phone  
           t.string :address
           t.string :address2
           t.string :city
           t.string :state
           t.string :zip
           t.string :country
           t.string :shipping_address_composite
           t.string :billing_address_composite

           t.string :terms # Net-30, blank (meaning?) 
           t.string :price_schedule # enum: Tru-Blu, Corporate 1/2/3, one instance of List, Dealer 1/2

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
