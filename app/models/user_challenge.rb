class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :user_challenge_steps, dependent: :destroy
  mount_uploader :image, PhotoUploader

  after_update :update_user_rewards if :will_save_change_to_completed?

  def update_user_rewards
    category = self.challenge.category
    user_reward = UsersReward.joins(category_reward: :category).find_by(category_rewards: { category: category }, user: self.user)
    user_reward.completed_challenges += 1
    user_reward.save
  end
end
