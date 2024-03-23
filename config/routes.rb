Rails.application.routes.draw do
  resources :users
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end
  root to: 'questions#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete 'logout', to: 'sessions#destroy'
end
