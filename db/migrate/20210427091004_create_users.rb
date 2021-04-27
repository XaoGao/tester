class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :login, default: "", null: false
      t.string :password_digest, default: "", null: false
      t.string :first_name, default: "", null: false
      t.string :last_name, default: "", null: false
      t.string :middle_name, default: "", null: false
      t.references :role
      t.boolean :lock, default: false, null: false
      t.timestamps
    end
  end
end
