class Exercise < ActiveRecord::Base
  has_many :repetitions
  has_many :workouts, through: :repetitions
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :type, presence: true
end