class UsersReward < ApplicationRecord
  belongs_to :user
  belongs_to :category_reward
  validates :user, uniqueness: { scope: :category_reward }

  after_update :update_shown, if: :completed_challenges_previously_changed?

  def update_shown
    if (completed_challenges >= category_reward.min_challenges && completed_challenges < category_reward.max_challenges)
      self.shown = true
    else
      self.shown = false
    end
    self.save!
  end
end
