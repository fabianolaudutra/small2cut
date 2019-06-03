Rails.application.routes.draw do 
  
  resources :users do 
    resources :urls
    resources :stats
  end
  post '/user', to: 'users#destroy'
  get '/urls/:id', to: 'urls#show'
  post '/urls', to: 'urls#destroy'
  get '/stats', to: 'stats#index'
  #post '/users', to: 'users#create'
  #get '/users', to: 'users#show'
  #post '/user', to: 'users#destroy'

  #get '/urls', to: 'urls#show'
  #post '/users/:userid/urls', to: 'url#create' # cria url
  #post '/urls', to: 'urls#create'

 
  #GET /urls/:id [ok]
  #DELETE /urls/:id  [ok] mas esta dando erro no retorno
  #POST /users/:userid/urls [ok]
  
  #GET /stats
  #GET /users/:userId/stats
  #GET /stats/:id
  
  #POST /users ok
  #DELETE /user/:userId [ok]
end
