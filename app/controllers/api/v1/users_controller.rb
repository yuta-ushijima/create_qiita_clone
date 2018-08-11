class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      render json: @user, serializer: SessionSerializer, status: 200
    else
      render json: { error: t('user_create_error') }, status: 422
    end
  end

  def update
    @user = current_user.find(params[:id])
    if @user.present?
      @user.update(user_params)
      render json: @user, status: 200
    else
      render json: @user, status: 400
    end
  end

  def destroy
    @user = current_user.find(params[:id])
    @user.destroy
    render json: @user, status:204
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end