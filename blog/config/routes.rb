Rails.application.routes.draw do
  root to: "posts#index"

  devise_scope :user do
    get 'users/:id' => 'registrations#show'
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do
    resources :comments
  end
end
