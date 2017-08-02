class AddStateToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :state, :decimal, default: 2
  end
end
