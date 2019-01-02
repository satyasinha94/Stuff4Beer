class UsersController < ApplicationController

  def main
  end

  def new
    @user = User.new
  end

  def login
  end

  def show
    find_user
    render "my_listings"
  end

  def create
    @user = User.create(listing_params)
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
