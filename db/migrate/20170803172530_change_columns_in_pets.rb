class ChangeColumnsInPets < ActiveRecord::Migration[5.0]
  def change
    change_column :pets, :alive, :boolean, default: true
  end
end
