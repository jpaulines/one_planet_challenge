class CategoryReward < ApplicationRecord
  belongs_to :category
  has_many :user_rewards
end
