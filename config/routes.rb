Rails.application.routes.draw do
  resources :subscriptions

  get "/products",     to: "products#index"
  get "/products/:id", to: "products#show", as: "product"


  # Allows for the admin to see products page.
  namespace :admin do 
    resources :products
    resources :customers
  end

  root to: "subscriptions#new"

end
