class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :number, default: '', null: false
      t.string :slug, default: '', null: true
      t.timestamps
    end
  end
end
