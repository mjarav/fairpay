Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: [:index, :update]
end
