class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @users = User.new(user_params)
    if @users.save
      render json: "You're succeeded User Registration!\n", status:200
    else
      render json: "You're failed User Registration...", status: 400
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.present?
      @user.update(user_params)
      render json: "You're succeeded update data\n", status:200
    else
      render json: "You're failed update data\n", status: 400
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: "You're succeeded destroy id: #{@user[:id]}", status:204
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password ,:password_confirm)
  end
end
