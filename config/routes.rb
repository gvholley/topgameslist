Rails.application.routes.draw do
  devise_for :users
  resources :games
  root to: 'pages#home'
  get '/search', to: 'games#search', as: :search
  get '/games', to: 'games#index', as: :index
end
