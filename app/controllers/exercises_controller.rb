class ExercisesController < ApplicationController
  
  def new
    @exercise = Exercise.new
  end
  
  def index
    @exercises = Exercise.all
    @workout = Workout.find_by(id: params[:workout_id])
    if @exercises.length == 0
      redirect_to new_workout_exercise_path
    end
  end
  
  def create
    @exercise = Exercise.find_by(name: params[:exercise][:name])
    if !@exercise.nil?
        redirect_to workout_exercises_path
    else
      @exercise = Exercise.create(exercise_params)
      if @exercise.save
        @exercise = Exercise.find_by(name: exercise_params[:name])

        redirect_to workout_exercises_path
      else
        redirect_to new_workout_exercise_path(@exercise.workout_id)
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end

  def set_exercise
    @exercise = Eercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :exercise_type, :equipment, :description)
  end

  def check_login
    if !logged_in?
      redirect_to login_path
    end 
  end

end