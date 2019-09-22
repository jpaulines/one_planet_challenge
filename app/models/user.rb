class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_interests
  has_many :user_challenges
  has_many :categories, through: :user_interests
  has_many :challenges, through: :user_challenges
  mount_uploader :image, PhotoUploader
end
