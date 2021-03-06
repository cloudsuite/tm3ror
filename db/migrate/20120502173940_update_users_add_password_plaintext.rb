class UpdateUsersAddPasswordPlaintext < ActiveRecord::Migration
  def self.up
     drop_table(:users) 
     create_table(:users) do |t|
         t.string :type # for STI implmentation of inheritance: CLINICIAN < USER
         t.string :salutation # unused placeholder for Dr. Mr. Ms. Mrs, ... 
         t.string :first_name
         t.string :last_name
         t.string :title # Dr, Phd, RN, LPT, ...
         t.string :email
         t.string :password # in plaintext for testing
         t.string :phone # work phone
         t.string :extension # work phone extension, if any 
         t.boolean :clinician # redundant with type, but used in sign-up (registration) form  
         t.integer :clinic_id # foreign key of clinic tuple, used internally, not visible to user
         t.string  :clinic_name # if user is a clinician, clinic he/she is part of 
         t.integer :clinic_trumedical_id # TruMedical's number for the clinic (4 digits) 
         t.string  :role # at clinic: administrator, ... 
         t.string  :authorization_code
         t.string :address # of clinic
         t.string :address2
         t.string :city
         t.string :state
         t.string :zip
         t.string :price_schedule # used to cache information from user.clinic.price_schedule
         t.integer :wants_n_catelogs
         # added by devise:
         t.database_authenticatable :null => false
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
     add_index :users, :reset_password_token, :unique => true
     # add_index :users, :confirmation_token,   :unique => true
     # add_index :users, :unlock_token,         :unique => true
     # add_index :users, :authentication_token, :unique => true
  end

  def self.down
  end
end
