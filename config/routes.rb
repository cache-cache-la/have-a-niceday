Rails.application.routes.draw do
  devise_for :users
  root "entries#index"
  resources :users, only: [:edit, :update, :show]
  resources :entries do
    resources :comments
  end
end
