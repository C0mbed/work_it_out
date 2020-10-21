class SessionsController < ApplicationController

  def create_facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      full_name = auth['info']['name'].split(" ")
      u.first_name = full_name[0]
      u.last_name = full_name[1]
      u.email = auth['info']['email']
      u.password = auth['uid']
    end
    session[:user_id] = @user.id
    redirect_to workouts_path(@user)
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to workouts_path(@user)
    elsif params[:email] == ""
      flash[:notice] = "email is required"
      redirect_to login_path
    else
      flash[:notice] = "email or password incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end

  private 

  def auth
    request.env['omniauth.auth']
  end
end