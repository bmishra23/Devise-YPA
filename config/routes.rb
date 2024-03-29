YpaIteration0::Application.routes.draw do

  #devise_for :controllers

  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations" }

  get "welcome/about"

  get "welcome/contact"

  get "login/login"

  get "login/logout"
  
  get "/events/search"

  get "/welcome/", to: 'welcome#index'

  get "/welcome/index", to: 'welcome#index'

  get "/users/list", to: 'users#list'


  #######################################################
  # User Events                                         #
  #######################################################
  get 'events/user', to: 'events#user'
  get 'events/rsvp/:id', to: 'events#rsvp'
  get 'events/check_in/:id', to: 'events#check_in'
  #######################################################

  resources :categories


  resources :interests


  resources :events


  #resources :users


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
  root :to => 'events#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
