Rails.application.routes.draw do


  devise_for :users, controllers: { registrations: "registrations" }
  resources :rooms do
    resources :bookings, only: [:new, :create]
    resources :residents
    resources :unavailabilities
  end
  resources :chatrooms do
    resources :chats
  end
  resources :bookings, except: [:new, :create] do
    post 'confirmed', on: :member
    post 'declined', on: :member
  end
  resources :charities, only: [:index, :show] do
    resources :guests
  end

  # resources :charities, except: [:index, :show] do

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

# index, create and destroy for chatrooms
# chats - create and destroy
