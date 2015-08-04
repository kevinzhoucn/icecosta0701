Rails40Starter::Application.routes.draw do

  # resources :partners, only: [:index]

  resources :pictures, only: [:index, :show]

  get '/news/search' => 'news#search', as: :news_search
  get '/activities/search' => 'activities#search', as: :activities_search
  get '/positions/search' => 'positions#search', as: :positions_search
  get '/resumes/succeed' => 'resumes#succeed', as: :resumes_succeed
  # resources :slides
  
  resources :positions, only: [:index, :show] do
    resources :resumes, only: [:new, :create]
  end
  resources :activities, only: [:index, :show]
  resources :news, only: [:index, :show]
  resources :services, only: [:index, :show]

  namespace :cpanel do
    get '/' => 'front#index', as: :front_index    
    get '/about'=> 'front#about', as: :front_about
    get '/contact' => 'front#contact_us', as: :front_contact
    get '/glossary' => 'front#glossaries', as: :front_glossary
    resources :site_configs
    resources :news
    resources :activities
    resources :services
    resources :positions
    resources :slides
    resources :pictures
    resources :partners
  end

  get '/about' => 'front#about', as: :front_about
  get '/contact' => 'front#contact_us', as: :front_contact
  get '/search' => 'front#site_search', as: :front_search
  get '/glossary' => 'front#glossaries', as: :front_glossary

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
