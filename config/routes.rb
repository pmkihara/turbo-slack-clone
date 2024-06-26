Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :channels, except: %i[edit update destroy] do
    resources :memberships, only: %i[create]
    resources :posts, only: %i[create update]
  end
  resources :posts, only: %i[show edit destroy] do
    resources :posts, only: %i[create update]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
