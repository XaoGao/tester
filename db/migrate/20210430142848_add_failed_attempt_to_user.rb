class AddFailedAttemptToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :failed_attempt, :int, default: 0, null: false
    User.all.each do |u|
      u.update(failed_attempt: 0)
    end
  end
end
