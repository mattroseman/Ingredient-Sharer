Rails.application.routes.draw do

  # misc. static pages
  get 'about/index'
  get 'welcome/index'

  # differentiate devise user view and user profile view
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]
  devise_scope :user do
    authenticated :user do
      # Once we are done making the posts scaffold:
      # root :to => 'posts#index', as: :authenticated_root
      root :to => 'welcome#index', as: :authenticated_root
    end
      root :to => 'welcome#index', as: :unauthenticated_root
  end

  # root routes
  root 'welcome#index'

  # post-comment relationship
  resources :posts do
    resources :comments
  end

  # user-related stuff
  match '/users',      to: 'users#index', via: 'get'
  match '/users/:id',  to: 'users#show',  via: 'get'
  match '/users/edit', to: 'users#edit',  via: 'get'
  match '/users/promote/:id',  to: 'users#promote',  via: 'get'
  match '/users/demote/:id',  to: 'users#demote',  via: 'get'

  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # devise_for :users
  # get '/users/edit', :to => 'devise/registrations#edit', :as => :user

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
  #     #     resources :sales do
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
