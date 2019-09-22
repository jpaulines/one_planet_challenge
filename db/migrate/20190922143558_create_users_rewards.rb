class CreateUsersRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :users_rewards do |t|
      t.references :user, foreign_key: true
      t.references :category_reward, foreign_key: true
      t.integer :completed_challenges
      t.boolean :shown, default: false

      t.timestamps
    end
  end
end
