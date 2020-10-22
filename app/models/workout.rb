class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :repetitions
  has_many :exercises, through: :repetitions

  def self.filter(user_id)
    if !user_id.blank?
      Workout.where(id: user_id)   
    else
      Workout.all
    end
  end
end