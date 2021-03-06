Rails.application.routes.draw do
  get '/login', to: "sessions#login"
  post '/login', :to => "sessions#login_attempt"
  get 'logout', :to => "sessions#logout"

  resources :users, only: [:new, :create]


  #resources :positions

  #resources :rationales

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'main#index'

  match '/about', to: 'main#about', via: 'get'
  match '/portfolio', to: 'positions#index', via: 'get'
  match '/inactive', to: 'positions#inactive', via: 'get'

  #get 'positions/inactive'
#shallow do
  resources :positions, only: [:new, :create, :edit, :update, :show] do
    resource :rationale, :controller => :rationales, only: [:new, :edit, :create] do
      get '', :on => :collection, :action => 'show'
      patch '', :on => :collection, :action => 'update'
      put '', :on => :collection, :action => 'update'
    end
  end





  #resource :positions, only: [] do
    #resource :rationales, only: [:show, :new, :create, :edit, :update]
  #end



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
  #match ':controller(/:action(/:id))(.:format)'
end
