class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    byebug
    if !@user.nil?
      session[:user_id] = @user.id

      flash[:notice] = "user account already exists, please login"
      redirect_to login_path
    else
      @user = User.create(user_params)
      if @user.save
        @user = User.find_by(email: user_params[:email])
        session[:user_id] = @user.id

        render '/workouts/home'
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

  def update
    @user = User.find(params[:id])
    if current_user.id == @user.id && logged_in?
      @user.update(user_params)

      flash[:notice] = "update successful"
      redirect_to workouts_path
    else
      flash[:notice] = "You do not have perission to edit this user"
      redirect_to workouts_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
  end
end