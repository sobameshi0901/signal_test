class ChangeDatatypePhoneOfShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :phone, :integer
  end
end
