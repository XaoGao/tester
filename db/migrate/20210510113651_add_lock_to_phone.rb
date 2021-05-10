class AddLockToPhone < ActiveRecord::Migration[6.1]
  def change
    add_column :phones, :lock, :boolean, default: false, null: false
  end
end
