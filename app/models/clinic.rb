class Clinic < ActiveRecord::Base
   has_many :users # actually only the subtype of users, clinicians; set up STI
   has_many :clinicians
   has_one :administrator
   scope :alpha_test_clinics, where(:alpha => 1)
   scope :beta_test_clinics, where(:beta => 1) 
end
