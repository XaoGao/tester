class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name, null: false, deafult: ''
      t.boolean :lock, null: false, default: false
      t.integer :sort_level, defatl: 0, null: false
      t.timestamps
    end
  end
end
