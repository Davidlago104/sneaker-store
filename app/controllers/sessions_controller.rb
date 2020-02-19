class SessionsController < ApplicationController
  def welcome

  end

  def new
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

end #end of class
