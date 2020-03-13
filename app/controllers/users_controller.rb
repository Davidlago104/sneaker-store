class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create #creates a user then automatically logs them in so they can acess everything
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:congrats] = "Welcome to the community!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show # signing in an creating a new session
    @user = User.find_by_id(params[:id])
    flash[:success] = "You've signed in!"
    redirect_to '/' if !@user
  end

  private

  def user_params #takes the info from a user and perserves it
    params.require(:user).permit(:username, :email, :password)
  end

end #end of class
