class ClinicUpdate2 < ActiveRecord::Migration
  def self.up
     drop_table :clinics
       create_table :clinics do |t|
         t.integer  :customer_number
         t.string   :name
         t.string   :street
         t.string   :street2
         t.string   :city
         t.string   :state
         t.string   :zip
         t.string   :url
         t.string   :phone
         t.string   :billing_email
         t.string   :price_schedule
         t.string   :payment_terms # normally 30-days
         t.integer  :administrator
         t.string   :administrator_phone # if direct number different from main phone
         t.string   :administrator_extension
         t.string   :administrator_cell_phone
         t.string   :administrator_email

         t.timestamps
       end
  end

  def self.down
  end
end
