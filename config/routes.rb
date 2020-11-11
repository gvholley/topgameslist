Rails.application.routes.draw do
  devise_for :users
  resources :games
  root to: 'pages#home'
  post '/search', to: 'games#search', as: :search
  get '/games', to: 'games#index', as: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
