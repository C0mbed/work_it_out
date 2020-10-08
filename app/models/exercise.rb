class Exercise < ActiveRecord::Base
  has_many :repetitions
  has_many :workouts, through: :repetitions

end