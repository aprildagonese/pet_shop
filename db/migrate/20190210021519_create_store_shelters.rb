class CreateStoreShelters < ActiveRecord::Migration[5.1]
  def change
    create_table :store_shelters do |t|
      t.integer :store_id
      t.integer :shelter_id
    end
  end
end
