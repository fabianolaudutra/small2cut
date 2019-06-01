Rails.application.routes.draw do 
  
  #resources :urls
  #resources :users
  resources :users do 
    resources :urls
  end
  #resources :users do |users|
  #  resources :urls do |urls|      
  #  end
  #end
  
  
  #post '/users', to: 'users#create'
  #get '/users', to: 'users#show'
  #post '/user', to: 'users#destroy'

  #get '/urls', to: 'urls#show'
  #post '/users/:userid/urls', to: 'url#create' # cria url
  #post '/urls', to: 'urls#create'

 
  #GET /urls/:id <> get '/urls', to: 'urls#show' ok
  #DELETE /urls/:id
  #POST /users/:userid/urls
  
  #GET /stats
  #GET /users/:userId/stats
  #GET /stats/:id
  
  #POST /users ok
  #DELETE /user/:userId ok
end
