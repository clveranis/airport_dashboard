Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Root Route
  root to: 'airports#index'
  
  # Airport routes
  get '/search', to: 'airports#search', as: 'airport_search'
  get '/airports', to: 'airports#index', as: 'airports'
  get '/refresh_airport_data/:iata_code', to: 'airports#refresh_airport_data', as: 'refresh_airport_data'
  put '/create_airport', to: 'airports#update_or_create', as: 'airport_update_or_create'
end
