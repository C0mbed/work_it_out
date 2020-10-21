class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    @workout = Workout.find_by(id: params[:workout_id])
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end