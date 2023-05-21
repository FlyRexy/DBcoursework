Rails.application.routes.draw do
  get 'show/shops'
  get 'show/clients'
  get 'show/employees'
  get 'show/purchases'
  get 'show/cakes'
  get 'show/purchase_details'
  get 'show/reviews'
  get 'data/shops'
  get 'data/clients'
  get 'data/employees'
  get 'data/purchases'
  get 'data/cakes'
  get 'data/purchase_details'
  get 'data/reviews'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "show#main"
end
