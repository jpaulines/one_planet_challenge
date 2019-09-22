class AddImageToUserChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :user_challenges, :image, :string
  end
end
