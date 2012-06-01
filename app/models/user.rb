class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :trackable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :tm_customer_id, :netsuite_customer_id, :salutation, :first_name, :last_name, :title, :email, :phone, :extension, :role, :owner, :administrator, :clinician, :clinic_id, :clinic_tm_id, :clinic_name, :address, :address2, :city, :state, :zip, :price_schedule,:wants_n_catelogs,:password,:plain_text_password, :password_confirmation, :remember_me
  # Note: Rails' update_attributes method takes a hash of attributes and their values and automatically updates them and saves the result. However if one of the attributes in the hash is not marked attr_accessible, no value for that attribute is stored to disk.  
  # Thus encrypted_password here? Does devise use update_attributes? 
  # Should pasword be an actual field? Should it be stored on the disk? 
  
  # for handling catelog requests
  
  # clinician<<->clinic relationship, but here for all users? when/how does this get set? 
  # seems like it could be set in register/new, register/edit?
  # Actually, I would like in clinic#update to allow the clinic administrator to register clinicians without
  # going through register/new and to set this there.  
  # Is there someway to make that happen — ie to invoke the register.new method without showing the registrations/new.html.erb view?  
  #Seems like I ought to be able to pass the same set of params that is being collected in registrations/new.html.erb to the url defined in the register_new path 
  belongs_to :clinic
  
  def valid_password?(password)
     #return true if password == "apple777" 
     return true if password == self.password # not working as I expected it to
     super
  end
  
  # Do we need the class Clinician, or are these just Users where type="clinician"?    
  #def saveAsClinician
  #end
  
  #before_save :handleClinician
  #def handleClinician
  #   if role == "clinician" then 
  #      c = self.clinician # not currently a role defined on User
  #      c.plain_text_password = self.password
  #      c.save
  #    end
  #end
  
  after_create :send_NS

  private
  def send_NS
    customerid = self.tm_customer_id
    email = self.email
    pwd = self.password
    firstName = self.first_name
    lastName = self.last_name
    userrole = self.role
    
    puts 'test'
    puts pwd
    puts email
    puts customerid
    
    #clinic = 8, physician = 6, clinician = 24, patient = 
    case userrole
				when "administrator"
          customercategory = 8 
				when "clinician"
          customercategory = 24
				when "patient"
          customercategory = 7
				else 
	        customercategory = 6
  	  end
			
    
    @clinic = Clinic.find_by_id(self.clinic_id)
    clinic_netsuite_id = @clinic.netsuite_customer_id
    
    self.plain_text_password = pwd
    self.save
    
    @nsconnect = Nssoap.new()
    @nsconnect.update_customer(pwd, email, customercategory, firstName, lastName, clinic_netsuite_id)
    puts 'test finish'
  end
     

end
