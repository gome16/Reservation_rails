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
    collection do
      get 'search'
    end
    get 'users/:account',controller: 'users', action: 'show'
  end
  resources :rooms do
    collection do
      get :'search'
    end  
  
  end  

  

  resources :reservations do
    collection do
      post :confirm
    end
  end  
  
  root to: "home#index"
end
