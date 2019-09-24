class AddChallengeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :challenge, foreign_key: true
  end
end
