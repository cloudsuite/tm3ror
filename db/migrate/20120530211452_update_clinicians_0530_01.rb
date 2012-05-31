class UpdateClinicians053001 < ActiveRecord::Migration
  def self.up
      drop_table :clinicians
      create_table :clinicians do |t|
        t.integer   :clinic_id # required? yes, but filled in automatically when clinic administrator creates the skeleton object for the clinician
        t.string    :salutation # Ms/Mrs/Mr/Dr 
        t.string    :first_name
        t.string    :last_name
        t.string    :title # MD, PT, RN, ...  
        t.string    :role # unused now; here to allow clinic administrator to add additional administrators, by filling in "administrator"; not in table shown to her yet, though. 
        t.string    :password
        t.string    :plain_text_password
        t.string    :encrypted_password
        t.string    :email
        t.string    :work_phone_main
        t.string    :work_phone_extension
        t.string    :work_phone_direct
        t.string    :phone # mobile phone 

        t.timestamps
      end
  end

  def self.down
  end
end
