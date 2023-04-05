Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  resources :users do
    member do
      get 'account'
    end
  end
  get 'users/:account',controller: 'users', action: 'show'  
  resources :rooms 
  resources :reservations

  root to: "home#index"
end
