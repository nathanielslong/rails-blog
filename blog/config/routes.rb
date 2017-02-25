Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root to: "posts#index"

  # Takes care of most of the users routes using the registrations controller
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, :only => [:show]

  # sets following routes
  get 'users/:id/follow' => 'users#follow', as: "user_follow"
  get 'users/:id/follow/destroy' => 'users#destroy', as: "destroy_user_follow"

  # Makes comments resources children of the posts resources
  resources :posts do
    resources :comments
  end

end
