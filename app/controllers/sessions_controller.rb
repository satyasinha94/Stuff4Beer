class SessionsController < ApplicationController
  # before_action :authorized comes from ApplicationController

  # skip_before_action :authorized, only: [:new, :create]

  def register
    render :register
  end

  def login
    render :login
  end

  def create #handles the POST request to /login
    # byebug
    @user = User.find_or_create_by(name: params[:name])
    if @user #&& @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Can't find user!"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    # session[:user_id] = nil
    redirect_to main_path
  end

end
