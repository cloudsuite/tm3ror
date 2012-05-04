class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :trackable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :type, :salutation, :first_name, :last_name, :title, :email, :phone, :extension, :password, :password_confirmation, :clinician, :clinic_id, :clinic_name,:customer_id, :internal_customer_id, :address, :address2, :city, :state, :zip, :price_schedule,:wants_n_catelogs, :remember_me
  
  # for handling catelog requests
  
  # clinician<<->clinic relationship, but here for all users? 
  belongs_to :clinic
  


end
