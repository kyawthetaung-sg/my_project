Rails.application.routes.draw do
  resources :capitals
  resources :accounts
  resources :expenses
  resources :incomes
  resources :payment_modes
  resources :expense_categories
  get 'settings/index', :as => :settings
  get 'settings/edit_language', :as => :edit_language
  patch 'language/:id', to: 'settings#update_language', :as => :update_language
  get 'reports/index', :as => :reports
  resources :sale_lists do
    member do
      get :add_images
      delete :delete_image_attachment
    end
  end
  post '/sale_lists/:id/add_images', to: 'sale_lists#update_images', :as => :update_images_sale_list
  resources :customers
  resources :product_sales
  post 'product_sales/checkout/', to: 'product_sales#checkout'
  resources :business_types
  get '/business_types/:id/add', to: 'business_types#add', :as => :add_business_type
  resources :categories
  resources :roles
  get 'role/permission/:id', to: 'roles#permission', as: 'permission'
  post 'role/permission/:id/create_permission', to: 'roles#create_permission', as: 'create_permission'
  resources :themes
  get '/user_theme/:id', to: 'themes#update_user_theme', :as => :user_theme
  resources :pages
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
