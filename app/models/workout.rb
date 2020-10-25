class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :repetitions
  has_many :exercises, through: :repetitions
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :minutes, presence: true
  validates :minutes, numericality: { integer: true }
  validates :difficulty, presence: true
 

  def self.filter(user_id)
    if !user_id.blank?
      Workout.where(id: user_id)   
    else
      Workout.all
    end
  end
end