class Category < ApplicationRecord
  has_many :challenges, dependent: :destroy
  has_many :user_interests, dependent: :destroy
  has_many :category_rewards, dependent: :destroy
end
