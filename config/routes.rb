Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/gardens', to: 'gardens#index'
  get '/gardens/new', to: 'gardens#new'
  post '/gardens', to: "gardens#create"
  get '/gardens/:id', to: 'gardens#show'
  get '/gardens/:id/edit', to: "gardens#edit"
  patch '/gardens/:id', to: 'gardens#update'
  delete '/gardens/:id', to: 'gardens#destroy'
  
  get '/plants', to: 'plants#index'
  get '/plants/:id', to: 'plants#show'
  get '/plants/:id/edit', to: 'plants#edit'
  patch '/plants/:id', to: 'plants#update'
  post '/plants/:id', to: 'plants#create'
  delete '/plants/:id', to: 'plants#destroy'
  

  get '/gardens/:garden_id/plants', to: 'gardens/plants#index'
  get '/gardens/:garden_id/plants/new', to: 'gardens/plants#new'
  post '/gardens/:garden_id/plants', to: 'gardens/plants#create'
  post '/gardens/:garden_id/plants/only_return_records_with_more_than_8_of_plant_quantity', to: 'gardens/plants#index' 

end


