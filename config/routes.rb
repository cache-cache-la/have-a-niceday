Rails.application.routes.draw do
  devise_for :users
  root "entries#index"
  resources :users, only: [:edit, :update]
  resources :tags
  resources :entries do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
