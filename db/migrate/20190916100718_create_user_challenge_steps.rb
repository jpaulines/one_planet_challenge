class CreateUserChallengeSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :user_challenge_steps do |t|
      t.boolean :completed
      t.references :user_challenge, foreign_key: true

      t.timestamps
    end
  end
end
