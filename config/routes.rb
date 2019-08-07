Rails.application.routes.draw do
  resources :product_leftovers
  resources :stores
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products
  get "csv/import_products"
  post "csv/import_products" => 'csv#upload_products'
  get 'ajax/get_active_products'
  post "ajax/post_leftovers"
  get 'ajax/test_post_leftovers'

end
