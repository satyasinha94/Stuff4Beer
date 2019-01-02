class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

  def main
  end

  def new
    @user = User.new
  end

  def show
    render "my_listings"
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
