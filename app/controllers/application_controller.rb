class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end
