class ApplicationController < ActionController::Base

  def current_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end
end
