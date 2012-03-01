Tm2ror::Application.routes.draw do
   
  # get "product_set/show"  # Why the singular version? controller is product_sets

  devise_for :users, :path_names => { :sign_up => "register", :sign_in => "login" }
  # sign_out doesn't seem to getting set up properly. Why? needs :method => :delete ? stack overflow:
  #    ttp://stackoverflow.com/questions/6557311/no-route-matches-users-sign-out-devise-rails-3
  # I'm still getting the problem.
  
  # The following eliminates the undefined route which was causing the register page to not come up, but 
  # since there is no products controller in devise, it will cause an error if anyone attempts to use the         
  # Sammons search in the footer of the register page.  
    #devise_scope :products do
    #get "search", :to => "devise/products#search"
    #end
  
  # This attempts to route /devise/products/search to the search action defined in the 
  # ProductsController (without the Devise::module prefix).  
  # But Devise is an Engine not a Module. So this may not work 
  # I can't test it because devise is always showing me as signedin and the sign_out link is 
  # getting an unknown route error — regardless of whether I used the sign_out_path or 
  # explicitly specify the controller, the action, and the method.  
    scope "/devise" do
        get "products/search"
    end 
  # If this doesn't work try the following:  
  # devise_scope :products do
  #   get "search", :to => "/products#search"
  # end
  
   get "search/results"
   get "site/search"
   get "products/search" # for the metasearch on competitor part number
   # Why isn't this handled by adding a line to the resources :products declaration, to wit:
   #     resources :products do
   #        get 'search', : on => :collection
   #     end 
   #  Which should define the route helper search_products_path.  
   #  But I want to pass an :id to it:  the sammons part number 
   # Should it be? 

    resources :categories
    resources :product_types
    resources :product_sets
    resources :base_products
    resources :products
    #resources :users # site is using this for request a catalog form;  conflicting with devise?    
      
  resources :leaf_categories do  # can handle URLs of the form localhost:3000/leaf_categories/1/display
    get :display, :on => :member
  end
  
  get "home/index"
  get "home/circle" # used for version of the site that has colored circles in left nav
  
  root :to => "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
