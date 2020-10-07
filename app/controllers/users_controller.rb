class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if !@user.nil?
      session[:user_id] = @user.id

      render '/workouts/index'
    else
      @user = User.create(user_params)
      if @user.save
        @user = User.find_by(email: user_params[:email])
        session[:user_id] = @user.id

        render 'workouts'
      else
        redirect_to 'new'
      end
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
  end
end