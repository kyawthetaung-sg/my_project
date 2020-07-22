Rails.application.routes.draw do
  resources :themes
  get '/user_theme/:id', to: 'themes#update_user_theme', :as => :user_theme
  resources :pages
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
