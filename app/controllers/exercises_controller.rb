class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    @workout = Workout.find_by(id: params[:workout_id])
  end

  def new
  end
end