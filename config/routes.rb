Rails.application.routes.draw do
  devise_for :users,skip: :all,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }


  devise_scope :user do
    delete 'destroy' => 'devise/sessions#destroy',as: :current_user_destroy
  end

  root to: "items#index"


  resources :signups, only: [:index] do
    collection do
      get 'step1'   # 登録情報の一部を入力してもらう
      post 'step1', to: 'signups#step1_validates'  #step1で入力したデータのバリデーションチャックをする(詳しくはコントローラーで説明) render後にリロードしてもエラーが出ないようにget'step1'とURLは同じに設定する
      get 'step2'  # 残りの登録情報を入力してもらう
      post 'step2', to: 'signups#create' # 入力した情報すべてを保存 こっちもrenderするなら揃える
    end
  end

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
