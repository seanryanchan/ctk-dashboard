Rails.application.routes.draw do

  delete '/backlogs/:id', to: 'purchase_entries#releaseBacklog', as: 'release_backlog'

  get '/create_user', to: 'users#newUser', as: 'create_user'
  post '/create_user', to: 'users#createUser'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/history', to: 'histories#index', as: 'history'
  root "sessions#new"
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#newPurchasing', as: 'signup'
  post '/signup', to: 'users#createPurchasing', as: 'create_purchasing_user'


  get 'products/:id/release_form', to: 'products#releaseForm', as: 'release_product_form'
  patch 'products/:id/release', to: 'products#release', as: 'release_product'
  get 'products/:id/create_entry_form', to: 'purchase_entries#createEntryForm', as: 'create_entry_form'
  post '/create_entry/:id', to: 'purchase_entries#createEntry', as: 'create_entry'
  get '/create_backlog_form/:id', to: 'purchase_entries#backlogForm', as: 'backlog_form'
  post '/create_backlog/:id', to: 'purchase_entries#backlog', as: 'create_backlog'
  get "/backlogs", to: "purchase_entries#showBacklogs", as: "backlogs"
  get 'year_end', to: 'products#yearEnd', as: 'year_end'
  resources :purchase_entries
  resources :purchase_orders

  # actions show,index,new,create,delete,update,edit
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
