class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    byebug
    if !@user.nil?
      session[:user_id] = @user.id

      redirect_to "/users/#{@user.id}"
    else
      @user = User.create(user_params)
      if @user.save
        @user = User.find_by(email: user_params[:email])
        session[:user_id] = @user.id

        redirect_to "/lists/"
      else
        redirect_to 'new'
      end
    end
    byebug
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
  end
end