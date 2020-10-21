class Repetition < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise
  validates :reps, presence: true
  validates :sets, presence: true
  validates :reps, numericality: { only_integer: true }
  validates :sets, numericality: { only_integer: true }
end