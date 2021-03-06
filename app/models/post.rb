class Post < ApplicationRecord
  belongs_to :user
  belongs_to :challenge, optional: true
  has_many :answers, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :content, presence: true
  validates :title, presence: true
end
