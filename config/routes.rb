Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :permits do
    get "approve", to: "permits#approve"
    get "reject", to: "permits#reject"
  end
  resources :users, except: [:index]
  get "dashboard", to: "permits#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
