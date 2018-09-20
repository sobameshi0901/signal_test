class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :address
      t.integer :phone, limit: 1, null: false
      t.string :email
      t.string :image, null: false

      t.timestamps
    end
  end
end
