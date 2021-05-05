class AddCacheCount < ActiveRecord::Migration[6.1]
  def change
    add_column :positions, :users_count, :integer, default: 0, null: false
    add_column :departments, :users_count, :integer, default: 0, null: false

    Position.all.each do |p|
      p.users_count = 0
    end
    Department.all.each do |d|
      d.users_count = 0
    end
  end
end
