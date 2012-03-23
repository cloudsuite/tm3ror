class Request < ActiveRecord::Base
   #belongs_to :user
   validates_presence_of :first_name
   validates_presence_of :last_name
   validates_presence_of :email
   validates_presence_of :address
   validates_presence_of :city
   validates_presence_of :state
   validates_presence_of :zip
end
