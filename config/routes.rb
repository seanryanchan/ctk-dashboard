Rails.application.routes.draw do
  resources :purchase_entries
  resources :purchase_orders
  resources :products
  root "products#index"
  get "/backlogs", to: "products#showBacklogs", as: "backlogs"
end
