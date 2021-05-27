Rails.application.routes.draw do
  post "users", to: "users#create"
  post "/login", to: "users#login"
end
