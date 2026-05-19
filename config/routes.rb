Rails.application.routes.draw do
  resources :watchlist_companies, only: [:index, :show, :create, :update, :destroy]
  resources :watchlists, only: [:index, :show, :create, :update, :destroy]
  resources :transactions, only: [:index, :show, :create, :update, :destroy]
  resources :portfolios, only: [:index, :show, :create, :update, :destroy]
  resources :companies, only: [:index, :show, :create, :update, :destroy]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
