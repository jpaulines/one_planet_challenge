class CategoryReward < ApplicationRecord
  belongs_to :category
  has_many :users_rewards, dependent: :destroy
end
