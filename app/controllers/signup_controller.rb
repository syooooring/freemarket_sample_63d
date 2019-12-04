class SignupController < ApplicationController
  before_action :save_to_session, only: :address
  def create
    @user = User.new(session[:user_params2])
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
      # 保存失敗時の処理
    end
  end  

  def registration
    @user = User.new # 新規インスタンス作成
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
    session[:birthday_year_id] = user_params[:birthday_year_id]
    session[:birthday_month_id] = user_params[:birthday_month_id]
    session[:birthday_day_id] = user_params[:birthday_day_id]
    @user = User.new # 新規インスタンス作成
    # session[:nickname] = user_params[:nickname]
    # session[:email] = user_params[:email]
    # session[:password] = user_params[:password]
    # session[:password_confirmation] = user_params[:password_confirmation]
    # session[:family_name] = user_params[:family_name]
    # session[:last_name] = user_params[:last_name]
    # session[:j_family_name] = user_params[:j_family_name]
    # session[:j_last_name] = user_params[:j_last_name]
    # session[:birthday_year] = user_params[:birthday_year]
    # session[:birthday_month] = user_params[:birthday_month]
    # session[:birthday_day] = user_params[:birthday_day] @user = User.new # 新規インスタンス作成
    # session[:phone_number] = user_params[:phone_number]
    # @user = User.new # 新規インスタンス作成
  end

  def address
    session[:user_params2] = user_params
    session[:user_params2].merge!(session[:user_params1])
    @user = User.new # 新規インスタンス作成
    @user.build_address
    # session[:nickname] = user_params[:nickname]
    # session[:email] = user_params[:email]
    # session[:password] = user_params[:password]
    # session[:family_name] = user_params[:family_name]
    # session[:last_name] = user_params[:last_name]
    # session[:j_family_name] = user_params[:j_family_name]
    # session[:j_last_name] = user_params[:j_last_name]
    # session[:birthday_year] = user_params[:birthday_year]
    # session[:birthday_month] = user_params[:birthday_year]
    # session[:birthday_day] = user_params[:birthday_year]


    # session[:phone_number] = user_params[:phone_number]
    # session[:postal_code] = address_params[:postal_code]
    # session[:prefectures_id] = address_params[:prefectures_id]
    # session[:city] = address_params[:city]
    # session[:banti] = address_params[:banti]
    # session[:building_name] = address_params[:building_name]
    # session[:phone_number] = address_params[:phone_number]
    # @user = User.new # 新規インスタンス作成
  end

  def card
    session[:address_params] = user_params[:address_attributes]
    @user = User.new # 新規インスタンス作成
    @user.build_pay
    # session[:familyname] = user_params[:familyname]
    # session[:last_name] = user_params[:last_name]
    # session[:postal_code] = user_params[:postal_code]
    # session[:prefectures_id] = user_params[:prefectures_id]
    # session[:city] = user_params[:city]
    # session[:banti] = user_params[:banti]
    # session[:building_name] = user_params[:building_name]
    # session[:phone_number] = user_params[:phone_number]
    # session[:card_number] = user_params[:card_number]
    # session[:card_deadline] = user_params[:card_deadline]
    # session[:security_code] = user_params[:security_code]
  end

  def complete
    sign_in User.find(session[:id]) unless user_signed_in?
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

  # def adderss_params
  #   params.require(address).permit(
  #     :familyname, 
  #     :last_name, 
  #     :postal_code, 
  #     :prefectures_id, 
  #     :city, 
  #     :banti, 
  #     :building_name, 
  #     :phone_number, 
  #   )
  # end
end
