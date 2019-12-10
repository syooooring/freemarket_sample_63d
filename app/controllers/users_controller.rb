class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      # password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
    )
    if @user.save
      # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to complete_users_path
    else
      render '/signup/registration'
    end
  end

  def login
  end

  def show
  end

  def edit
  end

  def zoom
  end
  
  def registration
  end

 
  def profile
  end

  def card_info
  end

  def logout
  end
  
  def identification
  end


  private

  def user_params
  end
end