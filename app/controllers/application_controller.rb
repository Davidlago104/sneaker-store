class ApplicationController < ActionController::Base
 helper_method :current_user, :logged_in?

  private


  def current_user #Displays the helper method for a current user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in? #Checks to see if a user is logged in
    if !current_user
      flash[:error] = "Something went wrong! Please check your login and see if youre signed in."
      redirect_to login_path
    end
  end

end#end of class
