Rails.application.routes.draw do
  root to: "items#index"
<<<<<<< HEAD

    resources :items, only: [:index]
    resources :users, only: [:new, :create, :show, :edit]
=======
  resources :items, only: [:index]
  resources :users, only: [:new, :create, :show]
>>>>>>> master
end
