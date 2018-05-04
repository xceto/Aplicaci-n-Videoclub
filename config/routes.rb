Rails.application.routes.draw do
  root 'arriendos#index'
  get '/peliculas/lista' => 'peliculas#lista'
  get '/serials/lista' => 'serials#lista'

  resources :users do
    get '/arriendos' => 'users#arriendos'
    get '/arriendos/nuevo' => 'users#new'
    post '/arriendos/nuevo' => 'users#agrega_arriendo'
    post '/arriendos/:id/delete' => 'users#delete_arriendo'
  end 

  resources :arriendos
  resources :serials
  resources :peliculas
end