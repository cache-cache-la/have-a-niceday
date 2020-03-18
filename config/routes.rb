Rails.application.routes.draw do
  root "entries#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end

  resources :users, only: [:edit, :update, :show]
  resources :tags, only: [:show]
  resources :entries do
    resources :comments, only: [:create]
    collection do
      get "search"
    end
  end
end
