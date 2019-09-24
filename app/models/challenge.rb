class Challenge < ApplicationRecord
  belongs_to :category
  has_many :user_challenges, dependent: :destroy
  has_many :challenge_steps, dependent: :destroy
  has_many :users, through: :user_challenges
  has_many :posts, dependent: :destroy
  has_many :hearts, dependent: :destroy
end
