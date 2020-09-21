Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #flights
  resources :flights, only: [:index]

  #airlines
  resources :airlines, only: [:show]

  #passengers
  delete '/flights/passengers/:id/remove', to: 'flights#destroy'
  get '/passengers', to: 'passengers#index'

end
