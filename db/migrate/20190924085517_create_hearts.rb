class CreateHearts < ActiveRecord::Migration[5.2]
  def change
    create_table :hearts do |t|
      t.references :challenge, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
