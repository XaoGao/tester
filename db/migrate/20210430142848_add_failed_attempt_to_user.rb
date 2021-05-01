class AddFailedAttemptToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :failed_attempt, :int, default: 0, null: false
    add_column :users, :lock, :boolean, default: false, null: false
    User.all.each do |u|
      u.update(failed_attempt: 0, lock: false)
    end
  end
end
