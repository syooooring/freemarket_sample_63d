Rails.application.routes.draw do
  root to: "items#index"

  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create, :show, :edit]

end
