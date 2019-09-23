class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :answers
  validates :content, presence: true
  validates :title, presence: true
end
