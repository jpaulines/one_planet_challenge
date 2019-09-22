class AddDefaultCompletedToUserChallenges < ActiveRecord::Migration[5.2]
  def change
    change_column :user_challenges, :completed, :boolean, default: false
  end
end
