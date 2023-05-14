Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/gardens', to: 'gardens#index'
  get '/gardens/:id', to: 'gardens#show'
  get '/plants', to: 'plants#index'
  get '/plants/:id', to: 'plants#show'
  get '/gardens/:garden_id/plants', to: 'gardens/plants#index'
end
