class SessionsController < ApplicationController
  def welcome

  end

  def new
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def omniauth
    byebug
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

end #end of class
