Rails.application.routes.draw do

  # Controller for user
  get "profiles", to: "users#index"
  get "myprofile", to: "users#myprofile"
  get "users", to: "users#new"
  post "users", to: "users#create"
  put "users/:id", to: "users#update"
  delete "users/:id", to: "users#destroy"
  get "users/:id", to: "users#show"
  get "users/:id/links", to: "users#links"


  #routes and controller for links
  get "links", to: "links#index"
  post "links", to: "links#create"
  put "links/:id", to: "links#update"
  delete "links/:id", to: "links#destroy"
  get "links/:id", to: "links#show"
  get "links/:id/user", to: "links#user"


  root to: "main#index"

end
