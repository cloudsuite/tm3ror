class ClinicUpdate < ActiveRecord::Migration

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
       t.string   :billing_email
       t.string   :phone
       t.string   :price_schedule
       t.integer  :administrator
       t.string   :administrator_phone
       t.string   :administrator_extension

       t.timestamps
     end
   end

  def self.down
  end
end
