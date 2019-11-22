Rails.application.routes.draw do
  devise_for :users
  resources :rooms
  resources :bookings do
    post 'confirmed', on: :member
    post 'declined', on: :member
  end
  get 'users/show'
  get 'search', to: "pages#search"
  get 'about', to: "pages#about"
  get 'dashboard', to: "pages#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    root :to => "pages#dashboard"
  end
  # get 'switch_login', to: "pages#switch_login", as: :switch_login
  root to: 'pages#landing'
end

