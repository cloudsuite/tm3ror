class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :trackable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation,:phone, :extension, :clinician, :clinic_name, :address, :address2, :city, :state, :zip, :price_schedule, :remember_me
  
  # for handling catelog requests
  # has_many :requests
  


end
