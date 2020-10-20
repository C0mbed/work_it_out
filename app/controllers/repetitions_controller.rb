class RepetitionsController < ApplicationController
    def new
        @repetition = Repetition.new
        @repetition.workout_id = params[:workout_id]
        @repetition.exercise_id = params[:exercise_id]
    end

    def index
    end

    def create
        @repetition = Repetition.find_by(workout_id: repetitions_params[:workout_id])
        if !@repetitions.nil?
            redirect_to edit_workout_exercise_repetition_path
        else
          @repetition = Repetition.create(repetitions_params)
          if @repetition.save
            @repetition = Repetition.find_by(workout_id: repetitions_params[:workout_id])
    
            redirect_to workout_path(@repetition)
          else
            redirect_to workouts_path
          end
        end
      end

    private

    def repetitions_params
        params.require(:repetition).permit(:workout_id, :exercise_id, :reps, :sets)
    end
end