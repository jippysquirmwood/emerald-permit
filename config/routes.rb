Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :permits
  resources :users, except: [:index]
  get "dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
