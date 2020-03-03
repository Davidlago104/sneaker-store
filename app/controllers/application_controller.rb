class ApplicationController < ActionController::Base
 # before_action :set_current_user
 helper_method :current_user, :logged_in?
 # def set_current_user
 #   User.current = current_user
 # end

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

end
