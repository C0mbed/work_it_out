class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 8..20 }

  has_many :workouts

end