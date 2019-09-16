class AddContentToUserChallengeSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :user_challenge_steps, :content, :text
  end
end
