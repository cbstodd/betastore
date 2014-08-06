Rails.application.routes.draw do

  root to: "products#index"
  resources :subscriptions
  
  get "/products",     to: "products#index", as: "products"
  get "/products/:id", to: "products#show", as: "product"

  get "/cart", to: "carts#show", as: "cart"

  # Allows for the admin to see products page.
  namespace :admin do 
    resources :products
    resources :customers
  end



end
