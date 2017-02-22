Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :user

  resources :posts
  resources :users
end
