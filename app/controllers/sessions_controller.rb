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
    @user = User.find_by(name: params[:name])
    if @user #&& @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    elsif !@user
      flash[:notice] = "Can't find user!"
      redirect_to login_path
    end
  end

  def create_new #handles the POST request to /register
    @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect_to @user
  end

  def destroy
    session.delete(:user_id)
    redirect_to main_path
  end

end
