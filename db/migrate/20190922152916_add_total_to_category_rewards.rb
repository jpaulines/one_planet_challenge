class AddTotalToCategoryRewards < ActiveRecord::Migration[5.2]
  def change
    add_column :category_rewards, :total, :integer, default: 9
  end
end
