Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  resources :posts, only: :show do
    resources :comments, only: [:new]
  end
  put 'upvote_post/:id/:type' => 'static_pages#upvote', as: :upvote_post
  put 'downvote_post/:id/:type' => 'static_pages#downvote', as: :downvote_post
end
