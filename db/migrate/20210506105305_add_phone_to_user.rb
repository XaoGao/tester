class AddPhoneToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :phone, null: true, foreign_key: true
  end
end
