class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def index
    @workouts = Workout.all
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
    @workout = Workout.find(params[:id])
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :difficulty, :minutes, :workout_type)
  end

end