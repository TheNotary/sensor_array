ControlSwitch::Application.routes.draw do

  

  get "api/print_to_lcd", :to => "api#print_to_lcd"
  get "api/snap_photo", :to => "api#snap_photo"
  
  
  get "pages/wiringpi"
  get "/fail", :to => 'pages#fail'
  get "cmds/shutdown"
  get "cmds/restart"
  devise_for :users
  get "pages/check_pin_state"
  get "pages/camera"
  get "pages/ir"
  get "pages/electronics_lab"
  get "pages/time_clock"
  get "pages/lcd"
  get "pages/home"
  root 'pages#home'
  
  
  
  
  # match "/fail", :to "pages#fail"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
