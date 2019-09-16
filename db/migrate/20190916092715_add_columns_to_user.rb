class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :money_level, :integer
    add_column :users, :time_level, :integer
    add_column :users, :effort_level, :integer
    add_column :users, :greenpoint_score, :integer
    add_column :users, :planet_country, :integer
    add_column :users, :planet_user, :integer
  end
end
