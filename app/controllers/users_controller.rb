class UsersController < ApplicationController
  before_action :set_user
  skip_before_action :set_user, only: [:new, :create, :show]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if !@user.nil?
      session[:user_id] = @user.id

      flash[:notice] = "user account already exists, please login"
      redirect_to login_path
    else
      @user = User.create(user_params)
      if @user.save && @user.valid? 
        @user = User.find_by(email: user_params[:email])
        session[:user_id] = @user.id

        redirect_to workouts_path
      else
        flash[:notice] = []
        @user.errors.full_messages.each do |msg|
          flash[:notice] << "#{msg}"
        end

        redirect_to new_user_path
      end
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    end
  end

  def edit
  end

  def update
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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
  end
end