Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Root Route
  root to: 'airports#index'
  
  # Airport routes
  get '/search', to: 'airports#search', as: 'airport_search'
  get '/airports', to: 'airports#index', as: 'airports'
  put '/create_airport', to: 'airports#update_or_create', as: 'airport_update_or_create'
end