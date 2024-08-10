Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'welcome#index'
  resources :users do
    resources :contents do
      resources :ratings
    end
  end
  post "login", to: "authentication#login"
  post 'logout', to: 'authentication#logout'
end
