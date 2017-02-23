Rails.application.routes.draw do
  root to: "posts#index"

  get 'users/:id' => 'users#show'
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do
    resources :comments
  end
end
