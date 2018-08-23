class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user_from_token!

  def create
    @user = User.find_for_database_authentication(email: params[:email])
    return invalid_email unless @user

    if @user.valid_password?(params[:password])
      sign_in @user
      render json: @user, serializer: SessionSerializer, root: nil
    else
      invalid_password
    end
  end

  def destroy
    @user = User.find_for_database_authentication(email: params[:email])
    # 以下でもいいけど、keyが残る
    # session.delete("warden.user.user.key")
    reset_session
    render json: @user, status: 202
  end

  private

    def invalid_email
      warden.custom_failure!
      render json: { error: t("devise.failure.invalid_email") }
    end

    def invalid_password
      warden.custom_failure!
      render json: { error: t("devise.passwords.invalid") }
    end
end
