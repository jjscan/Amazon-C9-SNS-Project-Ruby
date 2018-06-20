Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users
  root 'posts#show'
  resources :mypage, only: [:index]
  resources :posts, except: [:show] do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    post "/like", to: "likes#like_toggle"
    resources :comments, only: [:create, :destroy]
  end
  resources :follows, only: [:create, :destroy]
end
