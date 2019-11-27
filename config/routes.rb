Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :show] do
    collection do
      get :buy
      get :buy1
    end
  end

  resources :users, only: [:new, :create, :show, :edit] do
    collection do
      get :logout
      get :sell
    end
    member do
      get  :identification
    end
  end
end
