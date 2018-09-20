class RechangeDatatypePhoneOfShop < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :phone, :string
  end
end
