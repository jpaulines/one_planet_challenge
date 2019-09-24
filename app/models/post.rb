class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :challenge, optional: true
  has_many :answers, dependent: :destroy
  validates :content, presence: true
  validates :title, presence: true
end
