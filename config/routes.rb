Rails.application.routes.draw do
  root 'items#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show]
  resources :items, only: [:index, :show]
  resources :orders
  resources :categories
  resources :cart_items

  namespace 'admin' do
    resources :categories
    resources :items
    resources :orders
  end
end
