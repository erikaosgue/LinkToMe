Rails.application.routes.draw do

  get "users", to: "users#index"
  post "users", to: "users#create"
  put "users/:id", to: "users#update"
  delete "users/:id", to: "users#destroy"
  get "users/:id", to: "users#show"


  root to: "main#index"

end
