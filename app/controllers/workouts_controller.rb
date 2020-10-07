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
      @workout = Workout.create(workout_params)
      if @workout.save
        @workout = Workout.find_by(title: workout_params[:title])

        redirect_to "workout/#{@workout.id}"
      else
        redirect_to 'workouts'
      end
    end
  end

  private

end