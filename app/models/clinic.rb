class Clinic < ActiveRecord::Base
   has_many :users # actually only the subtype of users, clinicians; set up STI
end
