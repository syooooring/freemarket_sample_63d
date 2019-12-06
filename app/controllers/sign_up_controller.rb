class SignUpController < ApplicationController
  before_action :authenticate_user!, only: :done

  def index
    redirect_to root_path if user_signed_in?
  end

  #omniauth_callbacks_controllerからリダイレクトされたアクション
  def save_to_session
    #sns認証を使った場合は情報利用してインスタンスを作成.
    #viewで条件分岐などを利用してパスワードフォームを表示させない
    if session[:password_confirmation]
      
      @user = User.new
      #omniauth_callbacks_controllerで定義したsession
      # nickname: session[:nickname],
      # family_name: session[:family_name],
      # last_name: session[:last_name],
      # password: session[:password],
      # email: session[:email],
      # j_family_name: session[:j_family_name],
      # j_last_name: session[:j_last_name],
      # birthday_day_id: session[:birthday_day_id],
      # birthday_year_id: session[:birthday_year_id],
      # birthday_month_id: session[:birthday_month_id],
      # phone_number: session[:phone_number]
    else
      @user = User.new
      
    end
  end

  def step1_validates
    # step2にデータを渡すためにsessionに入れる
    create_session(user_params)
    set_user_with_session
    @user.valid?
    skip_phonenumber_validate(@user.errors)
    if verify_recaptcha(model: @user, message: "選択してください") && @user.errors.messages.blank? && @user.errors.details.blank?
      render '/signup/registration/' unless @user.valid?s
    else
      @user.errors.messages[:birthday_day_id] = change_birthday_validate_message(@user)
      render :step1
    end
  end

  def step2
    @user = User.new
  end

  def create
    set_user_with_session
    @user[:phonenumber] = user_params[:phonenumber]
    if @user.save
      SnsCredential.create(  #ユーザ登録と同時にこっちも登録
        uid: session[:uid],
        provider: session[:provider],
        user_id: @user.id
      )
      sign_in User.find(@user.id) unless user_signed_in?
      redirect_to addresses_path
    else
      render :step2
    end
  end

  def done; end

  private

    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :lastname, :firstname,
                                  :j_last_name, :j_family_name, :birthday_year_id,
                                  :birthday_month_id, :birthday_day_id, :phonenumber)
    end

    def create_session(user_params)
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      # sns認証のときはsessionを使っている
      if session[:password_confirmation]
        session[:password] = session[:password_confirmation]
      else
        session[:password] = user_params[:password_confirmation]
        session[:password_confirmation] = user_params[:password_confirmation]
      end
      session[:lastname] = user_params[:lastname]
      session[:firstname] = user_params[:firstname]
      session[:j_last_name] = user_params[:j_last_name]
      session[:j_family_name] = user_params[:j_family_name]
      session[:birthday_year_id] = user_params[:birthday_year_id]
      session[:birthday_month_id] = user_params[:birthday_month_id]
      session[:birthday_day_id] = user_params[:birthday_day_id]
    end

    def set_user_with_session
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password_confirmation],
        password_confirmation: session[:password_confirmation],
        lastname: session[:lastname],
        firstname: session[:firstname],
        j_last_name: session[:j_last_name],
        j_family_name: session[:j_family_name],
        birthday_year_id: session[:birthday_year_id],
        birthday_month_id: session[:birthday_month_id],
        birthday_day_id: session[:birthday_day_id]
      )
    end

    # 電話番号をstep1で入力しないので空のときのバリデーションをスキップする
    def skip_phonenumber_validate(errors)
      errors.messages.delete(:phonenumber)
      errors.details.delete(:phonenumber)
    end

    # 生年月日のどれかにひとつでもバリデーションエラーがあった場合は同じエラーメッセージを表示する
    def change_birthday_validate_message(user)
      if user.errors.messages[:birthday_year_id].any? || user.errors.messages[:birthday_month_id].any? || user.errors.messages[:birthday_day_id].any?
        user.errors.messages.delete(:birthday_year_id)
        user.errors.messages.delete(:birthday_month_id)
        user.errors.messages[:birthday_year_id] = ["生年月日は正しく入力してください"]
      end
    end

    def delete_session
      session.delete(:nickname)
      session.delete(:email)
      session.delete(:password)
      session.delete(:password_confirmation)
      session.delete(:lastname)
      session.delete(:firstname)
      session.delete(:j_last_name)
      session.delete(:j_family_name)
      session.delete(:birthday_year_id)
      session.delete(:birthday_month_id)
      session.delete(:birthday_day_id)
      session.delete(:pid)
      session.delete(:provider)
    end
end
