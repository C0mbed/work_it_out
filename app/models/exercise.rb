class Exercise < ActiveRecord::Base
  has_many :repetitions
  has_many :workouts, through: :repetitions

  def self.filter(exercise_type)
    if !exercise_type.blank?
      Exercise.where(exercise_type: exercise_type)
    else
      Exercise.all
    end  
  end
end