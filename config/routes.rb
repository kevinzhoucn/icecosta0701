Rails40Starter::Application.routes.draw do

  resources :partners

  resources :pictures

  get '/news/search' => 'news#search', as: :news_search
  get '/activities/search' => 'activities#search', as: :activities_search

  resources :slides
  resources :resumes
  resources :positions
  resources :activities
  resources :news, except: [:search]  
  resources :services

  namespace :cpanel do
    get '/' => 'front#index', as: :front_index    
    get '/about'=> 'front#about', as: :front_about
    get '/contact' => 'front#contact_us', as: :front_contact
    resources :site_configs
    resources :news
    resources :activities
    resources :services
    resources :positions
    resources :slides
  end

  get '/about' => 'front#about', as: :front_about
  get '/contact' => 'front#contact_us', as: :front_contact

  devise_for :users
  
  root 'front#index'
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
