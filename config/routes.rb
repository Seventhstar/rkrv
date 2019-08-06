Rails.application.routes.draw do
  get 'ajax/get_active_products'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products
  get "csv/import_products"
  post "csv/import_products" => 'csv#upload_products'

end
