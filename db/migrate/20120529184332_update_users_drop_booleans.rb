class UpdateUsersDropBooleans < ActiveRecord::Migration

  def self.up
        drop_table(:users) 
        create_table(:users) do |t|
          t.string :type # for subtype names — STI implementation of subtypes in Rails
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
          t.integer :owner # redundant with role value "owner"; drop
          t.integer :administrator # redundant with role value "administrator"; drop
          t.integer :clinician # redundant with role vlaue "clinician"; drop

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
          # added by devise:
          t.database_authenticatable :null => false # was :null => false. hoping this lets someone sign in if password is correct, but encrypted_password is null (ie has not been set yet); it didn't
          t.recoverable
          t.rememberable
          t.trackable
          # t.encryptable
          # t.confirmable
          # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
          # t.token_authenticatable
          t.timestamps
      end

      add_index :users, :email,                :unique => true 
      #add_index :users, :reset_password_token, :unique => true # commented out so could load users table from a spreadsheet; reinstate with   change_table :users do |t| t.index :reset_password_token end 

      # the followinging indices are commented out because we are not using the devise functionality they support
      # add_index :users, :confirmation_token,   :unique => true
      # add_index :users, :unlock_token,         :unique => true
      # add_index :users, :authentication_token, :unique => true
    end

  def self.down
  end
end
