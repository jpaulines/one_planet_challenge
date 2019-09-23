class CreateCategoryRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :category_rewards do |t|
      t.references :category, foreign_key: true
      t.string :icon
      t.string :description
      t.string :name
      t.string :colour
      t.integer :min_challenges
      t.integer :max_challenges

      t.timestamps
    end
  end
end
