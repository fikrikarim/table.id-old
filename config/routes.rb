
Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
  get 'osn' => 'static_pages#osn'
  get 'update' => redirect('/osn')

  resources :posts
  resources :comments, only: [:new, :index, :create]

  put 'report/:id' => 'posts#report', as: :report
  put 'upvote_post/:id/:type' => 'static_pages#upvote', as: :upvote_post
  put 'downvote_post/:id/:type' => 'static_pages#downvote', as: :downvote_post

  resources :users, path: 'u', except: [:show, :edit]
  get 'u/:username' => 'users#show', as: :user_profile
  get 'u/:username/edit' => 'users#edit', as: :edit_profile
end
