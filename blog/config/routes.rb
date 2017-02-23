Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: "posts#index"

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, :only => [:show]

  get 'users/:id/follow' => 'users#follow', as: "user_follow"
  get 'users/:id/follow/destroy' => 'users#destroy', as: "destroy_user_follow"

  resources :posts do
    resources :comments
  end
end
