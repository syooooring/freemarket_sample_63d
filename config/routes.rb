Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :show] do
    collection do
      get :buy
      get :buy1
      get :details
    end
  end    
  resources :pays, only: [:new]
  resources :users, only: [:new, :create, :show, :edit] do
    collection do
      get :registration
      get :sms_confirmation
      get :address
      get :card
      get :complete
      get :logout
      get :sell
    end
    member do
      get :identification
      get :profile
      get :card_info
    end
  end
end
