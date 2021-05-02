class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.string :name, defualt: "", null: false
      t.boolean :lock, defualt: false, null: false
      t.timestamps
    end
  end
end
