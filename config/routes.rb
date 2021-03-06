Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :permits do
    get "approve", to: "permits#approve"
    get "reject", to: "permits#reject"
    get "request_approval", to: "permits#request_approval"
    patch "submit_request", to: "permits#submit_request"
    get "recall", to: "permits#recall"
  end
  resources :users, except: [:index]
  get "dashboard", to: "permits#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
