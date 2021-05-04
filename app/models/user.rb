# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  failed_attempt  :integer          default(0), not null
#  first_name      :string           default(""), not null
#  last_name       :string           default(""), not null
#  lock            :boolean          default(FALSE), not null
#  login           :string           default(""), not null
#  middle_name     :string           default(""), not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  department_id   :integer          not null
#  position_id     :integer          not null
#  role_id         :integer
#
# Indexes
#
#  index_users_on_department_id  (department_id)
#  index_users_on_position_id    (position_id)
#  index_users_on_role_id        (role_id)
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#  position_id    (position_id => positions.id)
#
class User < ApplicationRecord
  has_secure_password
  belongs_to :role
  belongs_to :position
  belongs_to :department

  validates :login, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  validates :password, presence: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :middle_name, presence: true, length: { maximum: 50 }

  def faile_attempt!
    attempt = failed_attempt + 1
    if attempt > 3
      update(lock: true)
    else
      update(failed_attempt: attempt)
    end
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end
end
