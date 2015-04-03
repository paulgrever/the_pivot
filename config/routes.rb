Rails.application.routes.draw do
  root "home#index"
  get '/auth/:provider/callback' => 'sessions#create'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:show]
  resources :items, only: [:index, :show]
  resources :businesses, only: [:show]
  resources :orders
  resources :categories
  resources :cart_items
  get 'graph/index'
  get 'graph/data_units', :defaults => { :format => 'json' }
  get 'graph/data_revenue', :defaults => { :format => 'json' }

  namespace "admin" do
    resources :categories
    resources :items
    resources :orders
  end
end
