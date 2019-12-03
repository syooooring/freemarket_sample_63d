Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get :buy
      get :buy1
      get 'test', to: 'test#index'
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
  
    end
    member do
      get :identification
      get :profile
      get :card_info
      get :zoom
    end
  end
end
