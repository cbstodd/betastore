Rails.application.routes.draw do

  root to: 'products#index'
  resources :subscriptions
  resources :orders, only: [:new, :create]
  
  get '/products',     to: 'products#index', as: 'products'
  get '/products/:id', to: 'products#show', as: 'product'

  post '/products/:product_id/add_to_cart', to: 'carts#update', as: 'add_to_cart'
  get '/cart', to: 'carts#show', as: 'cart'

  put '/order', to: 'orders#update', as: 'order'


  # Allows for the admin to see products page.
  namespace :admin do 
    resources :products
    resources :customers

    get "/login",  to: "logins#new", as: "logins"
    post "/login", to: "logins#create"
  end



end
