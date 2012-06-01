require File.dirname(__FILE__) + '/test_helper.rb'

class Nssoap
  include NetSuite::SOAP

  

  
  def update_customer(pwd, email, customercategory, firstName, lastName, clinic_netsuite_id)
    ENV['NS_ENDPOINT_URL'] ||= 'https://webservices.netsuite.com/services/NetSuitePort_2011_2'
    ENV['NS_ACCOUNT_ID'] ||= '1114349'
    ENV['NS_EMAIL'] ||= 'info@cloudsuitemedia.com'
    ENV['NS_PASSWORD'] ||= 'cloudsuite1'
    ENV['NS_ROLE'] ||= '3'
    
    @client = NetsuiteClient.new(:account_id => 1114349, :email => 'info@cloudsuitemedia.com', :password => 'cloudsuite1')
  	
  	
    companyName = "Pablo Tester"
  	puts 'pwd'
  	puts pwd
  	puts 'email'
    puts email
    puts  'customercategory'
    puts customercategory
    
  	cliid = ""
  	
  	#if(customerid!=nil && customerid!='')
  	if(customercategory==8)   
  	  ## CLINIC ADMINISTRATOR, UPDATE EXISTING CUSTOMER RECORD IN NETSUITE ##
      customerid = customerid.to_s
      #customer = @client.find_by_contains('CustomerSearchBasic', 'entityId', customerid)
      customer = @client.find_by_internal_id('CustomerSearchBasic', clinic_netsuite_id)
      puts customer.size
    	cliid = customer[0].xmlattr_internalId;
    	puts cliid
    	customer[0].email = email
    	customer[0].giveAccess = true
      customer[0].password = pwd
      customer[0].password2 = pwd 
      @client.update(customer[0])
	  else
	      ## NEW CUSTOMER, CLINICIAN OR PATIENT ##
	      ref = Customer.new
        ref.email = email
        ref.giveAccess = true
        ref.password = pwd
        ref.password2 = pwd
        ref.firstName = firstName
        ref.lastName = lastName
        ref.isPerson = true
        if(clinic_netsuite_id!=nil && clinic_netsuite_id!="")
            puts "clinic netsuite id"
            puts clinic_netsuite_id
            @customclinicid = SelectCustomFieldRef.new()
            @customclinicid.xmlattr_internalId = "custentity_clinic_id"
            
            @customerlist =  ListOrRecordRef.new()
            @customerlist.xmlattr_internalId = clinic_netsuite_id
            
            @customclinicid.value = @customerlist
            
            puts @customclinicid
            
            @custfieldlist  = CustomFieldList.new(1)
            @custfieldlist[0] = @customclinicid
            ref.customFieldList = @custfieldlist
            
            #payment terms NET 30
            ref.terms = 2
        end
        
        #ref.companyName = companyName
        custt = RecordRef.new
        custt.xmlattr_internalId = customercategory
        custt.name = 'custtype'
        ref.category = custt
        res = @client.add(ref)
        puts res.success?
    end
  end

end
