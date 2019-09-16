class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :content
      t.integer :greenpoint
      t.integer :time
      t.integer :effort
      t.integer :money
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
