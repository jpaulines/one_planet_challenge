class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_interests
  has_many :user_challenges
  has_many :challenges, through: :user_challenges
  has_many :users_rewards
  mount_uploader :image, PhotoUploader
  after_create :create_rewards

  def create_rewards
    CategoryReward.all.each do |reward|
      UsersReward.create(user: self, category_reward: reward)
    end
  end
end
