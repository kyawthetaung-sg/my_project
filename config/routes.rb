Rails.application.routes.draw do
  resources :sale_lists
  resources :customers
  resources :product_sales
  post 'product_sales/checkout/', to: 'product_sales#checkout'
  resources :business_types
  resources :categories
  resources :roles
  resources :themes
  get '/user_theme/:id', to: 'themes#update_user_theme', :as => :user_theme
  resources :pages
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
