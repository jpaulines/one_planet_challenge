class AddQuizResultToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :quiz_result, :integer
  end
end
