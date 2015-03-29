Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  
  get 'insta_sessions/connect'
  get 'insta_sessions/callback'

  get 'static/about_nicole'

  resources :posts do
    resources :comments, except: [:index, :show]
  end
end
