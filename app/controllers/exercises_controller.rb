class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def new
  end
end