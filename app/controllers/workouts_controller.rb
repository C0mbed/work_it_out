class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def index
    @workouts = Workout.all
  end

end