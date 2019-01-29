Rails.application.routes.draw do
  resources :purchase_entries
  resources :purchase_orders
  resources :products do
    collection do
      get 'search', to: 'products#brandQuery', as: 'brand_query'
    end
  end
  root "products#index"
  get "/backlogs", to: "purchase_entries#showBacklogs", as: "backlogs"
end
