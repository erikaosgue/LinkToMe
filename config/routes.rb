Rails.application.routes.draw do

  # Controller for user
  resources :users
  get "profiles", to: "users#index"
  get "myprofile", to: "users#myprofile"
  
  resources :links

  root to: "main#index"

end
