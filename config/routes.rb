Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  get 'static/about_nicole'

  resources :posts do
    resources :comments, except: [:index, :show]
  end
end
