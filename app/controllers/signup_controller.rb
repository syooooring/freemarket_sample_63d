class SignupController < ApplicationController
  before_action :save_to_session, only: :address
  def create
    @user = User.new(
      nickname: session[:nickname],
      family_name: session[:family_name],
      last_name: session[:last_name],
      password: session[:password],
      email: session[:email],
      j_family_name: session[:j_family_name],
      j_last_name: session[:j_last_name],
      birthday_day_id: session[:birthday_day_id],
      birthday_year_id: session[:birthday_year_id],
      birthday_month_id: session[:birthday_month_id],
      phone_number: session[:phone_number]
    )
    @user.build_address(session[:address_params])
    @user.build_pay(user_params[:pay_attributes])
    begin 
      @user.save!
      puts "保存に成功しました"
      session[:id] = @user.id
      redirect_to complete_signup_index_path
    rescue ActiveRecord::RecordInvalid => e
      puts e
      puts "保存に失敗しました"
    end
  end  

  def registration
    @user = User.new
  end

  def save_to_session
    session[:phone_number] = user_params[:phone_number]
    
    @user = User.new(
      nickname: session[:nickname],
      family_name: session[:family_name],
      last_name: session[:last_name],
      password: session[:password],
      email: session[:email],
      j_family_name: session[:j_family_name],
      j_last_name: session[:j_last_name],
      birthday_day_id: session[:birthday_day_id],
      birthday_year_id: session[:birthday_year_id],
      birthday_month_id: session[:birthday_month_id],
      phone_number: session[:phone_number]
    )
    render '/signup/registration/' unless @user.valid?
  end

  def sms_confirmation
    
    
    session[:nickname] = user_params[:nickname]
    session[:family_name] = user_params[:family_name]
    session[:last_name] = user_params[:last_name]
    session[:password] = user_params[:password]
    session[:email] = user_params[:email]
    session[:j_family_name] = user_params[:j_family_name]
    session[:j_last_name] = user_params[:j_last_name]
    session[:birthday_day_id] = user_params[:birthday_day_id]
    session[:birthday_year_id] = user_params[:birthday_year_id]
    session[:birthday_month_id] = user_params[:birthday_month_id]
    @user = User.new
  end

  def address
    @user = User.new
    @user.build_address
  end

  def card
    session[:address_params] = user_params[:address_attributes]
    @user = User.new
    @user.build_pay
  end

  def complete
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(
      :email, 
      :nickname, 
      :password,
      :family_name, 
      :last_name, 
      :j_family_name, 
      :j_last_name, 
      :birthday_year_id, 
      :birthday_month_id, 
      :birthday_day_id, 
      :phone_number,

      address_attributes: 
      [:id,
      :family_name, 
      :last_name, 
      :postal_code, 
      :prefecture_id, 
      :city, 
      :banti, 
      :building_name, 
      :phone_number
      ],

      pay_attributes:
      [:id,
      :card_number, 
      :deadline_month_id,
      :deadline_year_id, 
      :security_code
      ]
    )
  end
end
