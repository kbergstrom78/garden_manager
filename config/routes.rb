Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/gardens', to: 'gardens#index'
  get '/gardens/:id', to: 'gardens#show'
end
