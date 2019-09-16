class CreateChallengeSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :challenge_steps do |t|
      t.text :content
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
