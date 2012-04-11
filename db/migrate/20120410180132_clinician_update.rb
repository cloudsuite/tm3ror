class ClinicianUpdate < ActiveRecord::Migration
   def self.up
       drop_table :clinicians
       create_table :clinicians do |t|
         t.integer   :clinic_id # required? 
         t.string    :salutation
         t.string    :first_name
         t.string    :last_name
         t.string    :title # MD, PhD, RN, ... 
         t.string    :role # one of administrator, ... 
         t.string    :password
         t.string    :email
         t.string    :phone # optional 

         t.timestamps
       end
     end


  def self.down
  end
end
