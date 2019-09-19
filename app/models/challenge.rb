class Challenge < ApplicationRecord
  belongs_to :category
  has_many :user_challenges, dependent: :destroy
  has_many :challenge_steps, dependent: :destroy
end
