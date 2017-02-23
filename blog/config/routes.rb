Rails.application.routes.draw do
  root to: "posts#index"

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts
end
