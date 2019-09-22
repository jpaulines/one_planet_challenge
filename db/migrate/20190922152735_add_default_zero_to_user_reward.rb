class AddDefaultZeroToUserReward < ActiveRecord::Migration[5.2]
  def change
    change_column :users_rewards, :completed_challenges, :integer, default: 0
  end
end
