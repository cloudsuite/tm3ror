class UsersController < ApplicationController
   def create
      if @user = User.create(params[:user])
         # success
      else
         # error handling
      end
      # return a flash message 'Got it; we'll mail a category (or set of catelogs) out to you shortly." 
   end
   
end
