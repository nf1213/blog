Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  get 'insta_sessions/connect'
  get 'insta_sessions/callback'

  get 'static/about_nicole'

  resources :posts do
    resources :comments, except: [:index, :show]
  end

  namespace :api do
    namespace :v1 do
      resources :posts, except: [:new, :edit]
    end
  end
end
