class Clinic < ActiveRecord::Base
   has_many :users # actually only the subtype of users, clinicians; set up STI
   has_many :clinicians
   has_one :administrator
end
