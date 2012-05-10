class CreateOldUsers < ActiveRecord::Migration
  def self.up

           create_table(:old_users) do |t|
              t.integer :tm_customer_id
              t.integer :netsuite_customer_id # 'internal customer id' in Kim's dump of Netsuite data
              t.string :salutation # currently unused placeholder for Dr. Mr. Ms. Mrs, ... 
              t.string :first_name
              t.string :last_name
              t.string :title # PhD, RN, ... 
              t.string :email
              t.string :phone # work phone
              t.string :extension # work phone extension, if any 
              t.string  :role # at clinic: owner, administrator, clinician, ... 
              t.boolean :owner # redundant with role value
              t.boolean :administrator # redundant with role value "administrator"
              t.boolean :clinician # redundant with role vlaue "clinician" or are all owners and administrators also considered clinicians?  ie they get the clinician pricing, for now, yes #14

              t.integer :clinic_id # foreign key of clinic tuple, used internally, not visible to user
              t.integer :clinic_tm_id # ?? merge with clinic_id? 
              t.string :clinic_name # if user is a clinician, clinic he/she is part of #17

              t.string :address # of clinic
              t.string :address2
              t.string :city
              t.string :state
              t.string :zip
              t.string :price_schedule # currently unused; used to cache information from user.clinic.price_schedule or if individual patients/caregivers get special pricing
                 # or, for patients that have been given non-list prices, to input the price_schedule they have been given 
              t.integer :wants_n_catelogs 
              t.string :password #25
              t.timestamps

          end
  end

  def self.down
    drop_table :old_users
  end
end
