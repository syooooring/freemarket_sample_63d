Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    delete 'destroy' => 'devise/sessions#destroy',as: :current_user_destroy
  end
  root to: "items#index"
  resources :items, only: [:index, :show] do
    collection do
      get :buy
      get :buy1
    end
  end
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
    end
  end
end
