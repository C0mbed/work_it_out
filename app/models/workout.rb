class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :repetitions
  has_many :exercises, through: :repetitions
end