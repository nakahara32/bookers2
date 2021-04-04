Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'home#top'
  get 'home/about'
  resources :books, only: [:new, :update, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:show, :index, :edit, :update]
end
