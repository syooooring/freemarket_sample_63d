Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :show] do
    collection do
      get :details
    end
  end
  resources :users, only: [:new, :create, :show, :edit]

end
