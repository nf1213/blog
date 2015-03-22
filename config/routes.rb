Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :posts, only: [:index, :new, :create] do
    resources :comments, only: [:new, :create]
  end
end
