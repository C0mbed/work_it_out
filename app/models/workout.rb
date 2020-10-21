class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :repetitions
  has_many :exercises, through: :repetitions

  def self.by_user(user_id)
    where(user: user_id)
  end
end