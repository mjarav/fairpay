Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services do
    resources :bookings, only: [:new, :create, :show]
    resources :reviews, only: [:new, :create]
  end

  # should the destroy method be in the show controller?
  resources :reviews, only: [:destroy]

  resources :bookings, only: [:index] do
    member do
      post :accept
      post :decline
    end
  end

end
