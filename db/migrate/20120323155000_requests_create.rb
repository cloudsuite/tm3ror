class RequestsCreate < ActiveRecord::Migration
  def self.up
     drop_table(:requests)
     create_table(:requests) do |t|
         t.string :first_name
         t.string :last_name
         t.string :email
         t.string :phone # work phone
         t.string :extension # work phone extension, if any 
         t.string :clinic_name # if user is a clinician, clinic he/she is part of 
         t.string :address # of clinic
         t.string :address2
         t.string :city
         t.string :state
         t.string :zip
         t.integer :number_of_catelogs_requested
         t.timestamps
     end
  end

  def self.down
  end
end
