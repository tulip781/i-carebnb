Rails.application.routes.draw do
  devise_for :users
  resources :rooms
  resources :bookings
  get 'users/show'
  get 'search', to: "pages#search"
  get 'about', to: "pages#about"
  get 'dashboard', to: "pages#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#landing"
end

