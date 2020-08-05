Rails.application.routes.draw do
  get 'reports/index', :as => :reports
  resources :sale_lists
  get '/sale_lists/:id/add_images', to: 'sale_lists#add_images', :as => :add_images_sale_list
  post '/sale_lists/:id/add_images', to: 'sale_lists#update_images', :as => :update_images_sale_list
  resources :customers
  resources :product_sales
  post 'product_sales/checkout/', to: 'product_sales#checkout'
  resources :business_types
  get '/business_types/:id/add', to: 'business_types#add', :as => :add_business_type
  resources :categories
  resources :roles
  resources :themes
  get '/user_theme/:id', to: 'themes#update_user_theme', :as => :user_theme
  resources :pages
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
