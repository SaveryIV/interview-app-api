Rails.application.routes.draw do
 resources :users do
  resources :contents do
    resources :ratings
  end
 end
 post "login", to: "authentication#login"
 post 'logout', to: 'authentication#logout'
end
