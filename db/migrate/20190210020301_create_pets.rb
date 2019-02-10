class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :name
      t.string :breed
      t.integer :shelter_id

      t.timestamps
    end
  end
end
