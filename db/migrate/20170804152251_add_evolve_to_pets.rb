class AddEvolveToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :evolve, :boolean, default: false
  end
end
