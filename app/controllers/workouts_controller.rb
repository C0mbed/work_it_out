class WorkoutsController < ApplicationController
  before_action :set_user
  before_action :set_workout
  skip_before_action :set_workout, only: [:index, :new, :create]
  before_action :check_login
  helper_method :params

  def new
    @workout = Workout.new
  end

  def index
    @users = User.all
    @workouts = Workout.filter(params[:user])
  end

  def create
    @workout = Workout.find_by(title: workout_params[:title])
    if !@workout.nil?
      if session[:user_id] == @workout.user_id
        redirect_to workout_path(@workout)
      else
        flash[:notice] = "you are not authorized to view this page"
        redirect_to workouts_path
      end
    else
      @workout = Workout.new(workout_params)
      @workout.user_id = session[:user_id]
      @workout.save
      if @workout.save
        @workout = Workout.find_by(title: workout_params[:title])

        redirect_to workout_path(@workout)
      else
        flash[:notice] = []
        @workout.errors.full_messages.each do |msg|
          flash[:notice] << "#{msg}"
        end
        
        redirect_to new_workout_path
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