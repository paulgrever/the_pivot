Rails.application.routes.draw do
  root "home#index"

  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/admin/dashboard", to: "admin/dashboard#index"
  post "/business/approval", to: "businesses#approve"


  resources :users
  resources :items, only: [:index, :show]
  resources :orders
  resources :categories
  resources :cart_items

  get "graph/index"
  get "graph/data_units", defaults: { :format => "json" }
  get "graph/data_revenue", defaults: { :format => "json" }
  get "/about", to: "about#index"

  namespace "admin" do
    resources :categories
    resources :items
    resources :orders
  end

  resources :businesses, except: [:show, :index]
  get "/:slug", as: "show_business", to: "businesses#show"
end
