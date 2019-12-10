class Users::RegistrationsController < ApplicationController

  
  password = Devise.friendly_token.first(7)
    if session[:provider].present? && session[:uid].present?
      @user = User.create(nickname:session[:nickname], email: session[:email], password: "password", password_confirmation: "password", j_family_name: session[:j_family_name],j_last_name: session[:j_last_name], family_name: session[:family_name], last_name: session[:last_name], birthday: session[:birthday], phone_number: params[:user][:phone_number])
      sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
    else
      @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], j_family_name: session[:j_family_name],j_last_name: session[:j_last_name], family_name: session[:family_name], last_name: session[:last_name], birthday: session[:birthday], phone_number: params[:user][:phone_number])
    end
end
