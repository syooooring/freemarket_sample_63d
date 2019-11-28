Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create, :show, :edit] do
    collection do
      get :registration
      get :sms_confirmation
      get :address
      get :card
      get :complete
    end
  end
end
