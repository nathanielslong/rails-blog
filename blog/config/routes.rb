Rails.application.routes.draw do
  root to: "posts#index"

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, :only => [:show]

  get 'users/:id/follow' => 'users#follow'

  resources :posts do
    resources :comments
  end
end
