class CreateShelters < ActiveRecord::Migration[5.1]
  def change
    create_table :shelters do |t|
      t.string :name
      t.integer :pet_id
    end
  end
end
