class WorkoutsController < ApplicationController
  before_action :set_user
  before_action :set_workout
  skip_before_action :set_workout, only: [:index]
  before_action :check_login
  helper_method :params

  def new
    @workout = Workout.new
  end

  def index
    @users = User.all
    if !params[:user].blank?
      @workouts = Workout.by_user(params[:user])   
    else
      @workouts = Workout.all
    end
  end

  def create
    @workout = Workout.find_by(title: workout_params[:title])
    if !@workout.nil?
      if session[:user_id] == @workout.user_id
        redirect_to "workout/#{@workout.id}"
      else
        #error message
        redirect_to 'workouts'
      end
    else
      @workout = Workout.new(workout_params)
      @workout.user_id = session[:user_id]
      @workout.save
      if @workout.save
        @workout = Workout.find_by(title: workout_params[:title])

        redirect_to "/workouts/#{@workout.id}"
      else
        redirect_to 'workouts'
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    @workout.update(title: params[:workout][:title], difficulty: params[:workout][:difficulty], minutes: params[:workout][:minutes], workout_type: params[:workout][:workout_type])
    redirect_to workout_path(@workout)
  end

  private
  def set_user
    @user = current_user
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:title, :difficulty, :minutes, :workout_type)
  end

  def check_login
    if !logged_in?
      redirect_to login_path
    end 
  end

end