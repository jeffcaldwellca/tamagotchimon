class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.boolean :alive
      t.datetime :date_of_death
      t.decimal :user_id

      t.timestamps
    end
  end
end
