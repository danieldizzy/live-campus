Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations"}

  resources :courses  do
    resources :chapters
    
  end

  resources :schools   

   #Subscriptions
  post   "/subscriptions" => "subscriptions#create"
  put    "/subscriptions" => "subscriptions#update"
  delete "/subscriptions" => "subscriptions#delete"

   #Progresses
  get    "chapters/read" => "progresses#show"
  post   "chapters/mark_as_complete" => "progresses#create"
  delete "chapters/mark_as_incomplete" => "progresses#delete"
  
  
  #Users
  get "/my_current_user" => "users#my_current_user"
  get "/subscribers" => "users#subscribers"
  get "/all_users" => "users#all_users"
  match 'users/:id' => 'users#update_user', via:[:patch]
  get '/send_password' => "users#reset_password"




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
