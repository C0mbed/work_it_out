class SessionsController < ApplicationController
  def new
  end

  def create_facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      full_name = auth['info']['name'].split(" ")
      u.first_name = full_name[0]
      u.last_name = full_name[1]
      u.email = auth['info']['email']
      u.password = auth['uid']
    end
    session[:user_id] = @user.id
    redirect_to user_workouts_path(@user)
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

  private 

  def auth
    request.env['omniauth.auth']
  end
end