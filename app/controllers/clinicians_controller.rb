# ————————————————————————————————————————————————————————————
#     Clinicians Controller
# ———————————————————————————————————————————————————————————
#
# Bugs:
#     1. need to encrypt user password before writing it to disk in a way that devise can work with it
#        ( Or invoke the devise register_new_user function rather than clinician#new ) 

class CliniciansController < ApplicationController
   # GET /clinicians
   # GET /clinicians.xml
   def index
     @clinicians = Clinician.all

     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @clinicians }
     end
   end

   # GET /clinicians/1
   # GET /clinicians/1.xml
   def show
     @clinician = Clinician.find(params[:id])
     @clinician.destroy # since getting here instead of clinicial#destroy
     respond_to do |format|
       format.html { redirect_to(edit_clinic_path(1), :notice => 'Clinician was successfully deleted.') } # abusing this
       format.xml  { render :xml => @clinician }
     end
   end

   # GET /clinicians/new
   # GET /clinicians/new.xml
   def new
     @clinician = Clinician.new
     @clinician.clinic = Clinic.find_by_id(current_user.clinic_id)

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @clinician }
     end
   end

   # GET /clinicians/1/edit
   def edit
     @clinician = Clinician.find(params[:id])
   end

   # POST /clinicians
   # POST /clinicians.xml
   def create
     @clinician = Clinician.new(params[:clinician])
     # need to encrypt password and write it to tuple for this clinician
     # Do it by hand? Invoking ... to encrypt it didn't work.  
     # Call devise somehow? user_registration_path. What does that URL expect as arguments? 
     respond_to do |format|
       if @clinician.save
         # again need id of clinic not id-=1
         format.html { redirect_to(edit_clinic_path(1), :notice => 'New Clinician successfully created') }
         format.xml  { render :xml => @clinician, :status => :created, :location => @clinician }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @clinician.errors, :status => :unprocessable_entity }
       end
     end
   end

   # PUT /clinicians/1
   # PUT /clinicians/1.xml
   def update
     @clinician = Clinician.find(params[:id])

     respond_to do |format|
       if @clinician.update_attributes(params[:clinician])
         # change this so that it goes to the clinic came from, not always clinic id=1
         format.html { redirect_to(edit_clinic_path(1), :notice => 'Clinician was successfully updated.') }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @clinician.errors, :status => :unprocessable_entity }
       end
     end
   end

   # For some reason not getting to #destroy from 'delete' link in views/clinics/#edit.html.erb;
   # going to #show instead  (as though it wasn't seeing the :method => :destroy argument) 
   
   # DELETE /clinicians/1
   # DELETE /clinicians/1.xml
   def destroy
     @clinician = Clinician.find(params[:id])
     @clinician.destroy

     respond_to do |format|
       format.html { redirect_to(edit_clinic_path(1), :notice => 'Clinician was successfully deleted.') } # supply clinic id as argument on call not clinic id=1
       format.xml  { head :ok }
     end
   end
end
