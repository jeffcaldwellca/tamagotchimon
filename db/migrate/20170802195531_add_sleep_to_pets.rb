class AddSleepToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :sleep, :decimal, default: 0
  end
end
