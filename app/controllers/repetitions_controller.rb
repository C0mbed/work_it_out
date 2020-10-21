class RepetitionsController < ApplicationController
    def new
        @repetition = Repetition.new
        @workout = Workout.find_by(id: params[:workout_id])
        @exercise = Exercise.find_by(id: params[:exercise_id])
    end

    def index
    end

    def create
        @repetition = Repetition.create(repetitions_params)
        if @repetition.save
            @repetition = Repetition.last
            @workout = Workout.find_by(id: @repetition.workout_id)
            @workout.repetitions << @repetition
            @workout.save
            
            redirect_to workout_path(@repetition.workout_id)
        else
            flash[:notice] = []
            @repetition.errors.full_messages.each do |msg|
              flash[:notice] << "#{msg}"
            end
    
            redirect_to new_workout_exercise_repetition_path(@repetition.workout_id, @repetition.exercise_id)
        end
    end

    def edit
        @repetition = Repetition.find(params[:id])
    end

    def update
        @repetition = Repetition.find(params[:id])
        @repetition.update(workout_id: params[:repetition][:workout_id], exercise_id: params[:repetition][:exercise_id], reps: params[:repetition][:reps], sets: params[:repetition][:sets])
        redirect_to edit_workout_path(@repetition.workout_id)
    end

    def destroy
        @repetition = Repetition.find(params[:id])
    end

    private

    def repetitions_params
        params.require(:repetition).permit(:workout_id, :exercise_id, :reps, :sets)
    end
end