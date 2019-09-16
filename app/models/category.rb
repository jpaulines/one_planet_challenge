class Category < ApplicationRecord
  has_many :challenges
  has_many :user_interests
end
