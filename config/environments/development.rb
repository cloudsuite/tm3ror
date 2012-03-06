Tm2ror::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb
  
  # This will remap ALL asset references:  images, stylesheets, javascripts, ... 
  
  ActionController::Base.asset_host = "http://s3.amazonaws.com/trumedical"
  
  # Unless I put them all up on the amazon s3 bucket, the application will not find its stylesheets and javascript files
  #ActionController::Base.asset_host = "s3.amazonaws.com/trumedical" 
  
  #Attempting to redirect references to just image assets per example in: 
  # http://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html 
  # isn't working. Why? 
  
  #ActionController::Base.asset_host = Proc.new { |source|
     #if source.starts_with?('/images')
     #   "http://s3.amazonaws.com/trumedical"
     #else
     #   "http://localhost:3000"
     #end
  #}
  # Seems to be never getting a true return from the test in the if statement

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  
  # defined for active admin 
  config.action_mailer.default_url_options = { :host => 'localhost:3000' } 

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
end

