Rails.application.routes.draw do
  get 'users/account'
  get 'users/profile'

  get 'rooms/home'

  devise_for :users
  get 'pages/home'
  get 'rooms/new'
  get 'reservations/index'
  get 'rooms/index'
  get 'users/login'


  resources :rooms do
    collection do
      get 'serch'
    end
  end

  resources :pages do
    collection do
      get 'home'
    end
  end

  resources :users
  resources :reservations
  resources :rooms

  resources :rooms do
    resources :reservations
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
