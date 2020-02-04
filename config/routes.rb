Rails.application.routes.draw do
  get 'user_roles/index'
  get 'conference/new'
  get 'conference/edit'
  resources :money_requests
  resources :salary_payments
  resources :expenses
  ActiveAdmin.routes(self)
  resources :staffs
  resources :stores
  resources :products
  resources :money_transfers
  resources :product_leftovers
  # devise_for :admin_users, ActiveAdmin::Devise.config


  post "ajax/switch_check"
  get "csv/import_products"
  post "csv/import_products" => 'csv#upload_products'

  get "csv/import_catalog"
  post "csv/import_catalog" => 'csv#upload_catalog'

  get 'ajax/get_active_products'
  post "ajax/post_leftovers"
  put "ajax/post_leftovers"
  get 'ajax/test_post_leftovers'

  get    'sign_up'  => 'users#new'
  post   'sign_up'  => 'users#create'
  # get ‘/signup’ => ‘users#new’
  # post ‘/users’ => ‘users#create’

  get    'login'   => 'sessions#new'                                   
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :roles
  resources :user_roles

  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  #   post 'sign_in', to: 'devise/sessions#create'
  #   # get 'login', to: 'devise/sessions#new'  
  # end

  # devise_for :users, controllers: {sessions: 'users/sessions'}
  
  # get    'login'   => 'devise/sessions#new'                                   
  # delete 'logout'  => 'devise/sessions#destroy'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :conferences
  resources :conference_records do
    resources :conference_records
  end

  resources :files
  get  '/download/:id'  => 'files#download'


  root to: "products#index"
end
