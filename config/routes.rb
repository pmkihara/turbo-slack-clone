Rails.application.routes.draw do
  get 'channels/show'
  get 'channels/new'
  get 'channels/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :channels, only: %i[new create show] do
    resources :posts, only: %i[create]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
