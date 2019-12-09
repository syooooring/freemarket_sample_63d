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

  def show
  end

  def edit
  end

  def zoom
  end
  
  def registration
  end

  # def sms_confirmation
  #    # session[:phone_number] = user_params[:phone_number]
  #    # @user = User.new # 新規インスタンス作成
  # end

  # def address
    # session[:familyname] = address_params[:familyname]
    # session[:last_name] = address_params[:last_name]
    # session[:postal_code] = address_params[:postal_code]
    # session[:prefectures_id] = address_params[:prefectures_id]
    # session[:city] = address_params[:city]
    # session[:banti] = address_params[:banti]
    # session[:building_name] = address_params[:building_name]
    # session[:phone_number] = address_params[:phone_number]
    # @user = User.new # 新規インスタンス作成

  # end

  # def card
    # session[:card_number] = pay_params[:card_number]
    # session[:card_deadline] = pay_params[:card_deadline]
    # session[:security_code] = pay_params[:security_code]
    # @user = User.new # 新規インスタンス作成
  # end

  # def complete
    # sign_in User.find(session[:id]) unless user_signed_in?
  # end

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
    #  params.require(:user).permit(:email, :encrypted_password, :nickname, :introduction, :family_name, :last_name, :j_familyname, :j_last_name, :birthday_year, :birthday_month, :birthday_day, :phone_number, :image, :point)
  end
end
