class AddDepartmentToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :department, null: false, foreign_key: true
    add_column :positions, :sort_level, :integer, default: 0, null: false
  end
end
