class UsersReward < ApplicationRecord
  belongs_to :user
  belongs_to :category_reward
  validates :user, uniqueness: { scope: :category_reward }
end
