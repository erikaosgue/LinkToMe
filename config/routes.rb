Rails.application.routes.draw do

  get "users", to: "user#list_all_users"
  post "users", to: "user#create_user"
  put "users", to: "user#update_user"
  delete "users", to: "user#delete_user"

  root to: "main#index"

end
