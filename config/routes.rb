Rails.application.routes.draw do
  root "home#index"
  get "/about", to: "home#about"

  get    "/auth/:provider/callback", to: "sessions#create"
  post   "/login",                   to: "sessions#create"
  get    "/auth/failure",            to: "sessions#failure"
  delete "/logout",                  to: "sessions#destroy"

  resources :users
  resources :items,      only:   [:index, :show]
  resources :orders,     only:   [:index, :show, :create]
  resources :categories, only:   [:show]
  resources :cart_items, except: [:edit, :show]

  get "graph/index"
  get "graph/data_units",   defaults: { format: "json" }
  get "graph/data_revenue", defaults: { format: "json" }

  patch "/:id/items", to: "business/items#update"

  scope "/:slug", module: "business" do
    get  "/items", as: "business_items", to: "items#index"
    post "/items", to: "items#create"
    get  "/items", as: "business_item", to: "items#edit"
    resources :items, except: [:index, :create, :show]
    get  "/orders", as: "business_orders", to: "orders#index"
    get  "/order/:id", as: "business_order", to: "orders#show"
    resources :orders, only: [:update]
  end

  namespace "admin" do
    resources :categories, except: [:show]
    get "/dashboard", to: "dashboard#show"
  end

  resources :business, except: [:show, :index, :edit, :create]
  post "/business/new", as: "businesses", to: "business#create"
  get  "/:slug", as: "show_business", to: "business#show"
  get  "/:slug/edit", as: "edit_business", to: "business#edit"
end
