Rails.application.routes.draw do
  get 'products/:id/release_form', to: 'products#releaseForm', as: 'release_product_form'
  patch 'products/:id/release', to: 'products#release', as: 'release_product'
  get 'products/:id/create_entry_form', to: 'purchase_entries#createEntryForm', as: 'create_entry_form'
  post '/create_entry/:id', to: 'purchase_entries#createEntry', as: 'create_entry'
  get '/create_backlog_form/:id', to: 'purchase_entries#backlogForm', as: 'backlog_form'
  post '/create_backlog/:id', to: 'purchase_entries#backlog', as: 'create_backlog'
  get "/backlogs", to: "purchase_entries#showBacklogs", as: "backlogs"
  get 'year_end', to: 'products#yearEnd', as: 'year_end'
  root "products#index"
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#createPurchasing', as: 'create_user'
  resources :purchase_entries
  resources :purchase_orders
  resources :products do
    member do
      get 'add_form', to: 'products#addForm', as: 'add_quantity_form'
      patch 'add', to: 'products#add', as: 'add_quantity'
    end
    collection do
      get 'search', to: 'products#brandQuery', as: 'brand_query'
    end
  end
end
