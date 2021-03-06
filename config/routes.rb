Rails.application.routes.draw do
  devise_for :users
  resources :games do
    member do
      put "add", to: "games#library"
      put "remove", to: "games#library"
    end
  end
  resources :library, only:[:index]
  root to: 'pages#home'
  get '/search', to: 'games#search', as: :search
  get '/games', to: 'games#index', as: :index
  get '/user/:id', to: 'user#show'
  get '/user/:id/library', to: 'library#index', as: :user_library
end
