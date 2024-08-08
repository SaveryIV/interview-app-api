Rails.application.routes.draw do
 resources :users
 post "login", to: "authentication#login"
 post 'logout', to: 'authentication#logout'
end
