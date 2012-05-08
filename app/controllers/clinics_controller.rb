class ClinicsController < ApplicationController
   # GET /clinics
   # GET /clinics.xml
   def index
     @clinics = Clinic.all

     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @clinics }
     end
   end

   # GET /clinics/1
   # GET /clinics/1.xml
   def show
     @clinic = Clinic.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @clinic }
     end
   end

   # GET /clinics/new
   # GET /clinics/new.xml
   def new
     @clinic = Clinic.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @clinic }
     end
   end

   # GET /clinics/1/edit
   def edit
     @clinic = Clinic.find(params[:id])
   end

   # POST /clinics
   # POST /clinics.xml
   def create
     @clinic = Clinic.new(params[:clinic])

     respond_to do |format|
       if @clinic.save
         format.html { redirect_to(root_path(), :notice => 'Your information has been saved.') }
         format.xml  { render :xml => @clinic, :status => :created, :location => @clinic }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @clinic.errors, :status => :unprocessable_entity }
       end
     end
   end

   # PUT /clinics/1
   # PUT /clinics/1.xml
   def update
     @clinic = Clinic.find(params[:id])

     respond_to do |format|
       if @clinic.update_attributes(params[:clinic])
         format.html { redirect_to(edit_clinic_path(@clinic), :notice => 'Clinic was successfully updated.') }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @clinic.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /clinics/1
   # DELETE /clinics/1.xml
   def destroy
     @clinic = Clinic.find(params[:id])
     @clinic.destroy

     respond_to do |format|
       format.html { redirect_to(clinics_url) }
       format.xml  { head :ok }
     end
   end
end
