ActiveAdmin.register Clinician do
   index do

         column "Rails Id",:id
         column :first_name
         column :last_name
         column :email
         column :clinic
         column :role
         column :plain_text_password
         default_actions
      end

      filter :clinic
      filter :last_name
      filter :id
  
end
