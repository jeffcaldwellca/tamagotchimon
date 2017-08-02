class AddExerciseToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :exercise, :decimal, default: 0
  end
end
