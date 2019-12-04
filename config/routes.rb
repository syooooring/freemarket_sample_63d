Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    delete 'destroy' => 'devise/sessions#destroy',as: :current_user_destroy
  end
  root to: "items#index"

  resources :items, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get :buy
      get :buy1
      get :details
    end
  end    
  resources :pays, only: [:new]
  resources :users, only: [:new, :create, :show, :edit] do
    member do
      get  :identification
      get :logout
      get :sell
    end
  end
  resources :signup, only: [:create] do
    collection do
      get :registration
      get :sms_confirmation
      get :address
      post :address
      get :card
      post :card
      get :complete
      post :complete
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
