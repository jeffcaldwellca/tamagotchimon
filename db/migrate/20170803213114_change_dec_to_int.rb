class ChangeDecToInt < ActiveRecord::Migration[5.0]
  def change
    change_column :pets, :user_id, :integer
      add_foreign_key :pets, :users
    change_column :pets, :sleep, :integer, default: 0
    change_column :pets, :exercise, :integer, default: 0
    change_column :pets, :state, :integer, default: 2
  end
end
