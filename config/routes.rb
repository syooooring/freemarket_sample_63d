Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create, :show, :edit] do
    member do
      get :profile
      get :card
    end
  end
  resources :pays, only: [:new]

end
