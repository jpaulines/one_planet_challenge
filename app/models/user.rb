class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_interests, dependent: :destroy
  has_many :user_challenges, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :categories, through: :user_interests
  has_many :challenges, through: :user_challenges
  has_many :users_rewards, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :image, PhotoUploader
  after_create :create_rewards
  after_create :initialize_greenpoints

  def create_rewards
    CategoryReward.all.each do |reward|
      if reward.name.include?("Base")
        UsersReward.create(user: self, category_reward: reward, shown: true)
      else
        UsersReward.create(user: self, category_reward: reward)
      end
    end
  end

  def initialize_greenpoints
    self.greenpoint_score = self.quiz_result
    self.save
  end
end
