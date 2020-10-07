class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_workouts_path(@user)
    else
      render login_path
    end
  end
end