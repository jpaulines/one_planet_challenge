class UsersReward < ApplicationRecord
  belongs_to :user
  belongs_to :category_reward
  validates :user, uniqueness: { scope: :category_reward }

  after_update :update_shown if :will_save_change_to_completed_challenges?

  def update_shown
    shown = (completed_challenges >= category_reward.min_challenges && completed_challenges < category_reward.max_challenges)
    self.save!
  end
end
