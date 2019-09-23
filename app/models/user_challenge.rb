class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :user_challenge_steps, dependent: :destroy
  mount_uploader :image, PhotoUploader

  after_update :update_user_rewards, if: :completed_previously_changed?

  def update_user_rewards
    category = self.challenge.category
    user_rewards = UsersReward.joins(category_reward: :category).where(category_rewards: { category: category }, user: self.user)
    user_rewards.each do |user_reward|
      user_reward.completed_challenges += 1
      user_reward.save
    end
  end
end
