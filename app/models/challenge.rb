class Challenge < ApplicationRecord
  belongs_to :category
  has_many :user_challenges
  has_many :challenge_steps
end
