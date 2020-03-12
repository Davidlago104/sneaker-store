class SessionsController < ApplicationController
  def welcome #welcome route for the session
  end

  def new #new route for the session
  end

  def destroy #logs out the user and clears the session
    session.delete(:user_id)
    flash[:success] = "You've successfully logged out!"
    redirect_to '/'
  end

  def create #Checks the user and matches the information and then the stores params
    #then creates a session for that user, if it doesnt match, theyre routed
    #to the login path to try again
      @user = User.find_by(username: params[:user][:username])

      if @user && @user.authenticate(password: params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to login_path
      # end
    end
  end

  def omniauth #omniauth instance method to help sign in with github
    @user = User.github_login(auth)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


  private

  def auth
    request.env['omniauth.auth']
  end
end #end of class
