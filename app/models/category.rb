class Category < ApplicationRecord
  has_many :challenges
  has_many :user_interests, dependent: :destroy
  has_many :category_rewards
end
