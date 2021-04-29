# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string           default(""), not null
#  last_name       :string           default(""), not null
#  login           :string           default(""), not null
#  middle_name     :string           default(""), not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role_id         :integer
#
# Indexes
#
#  index_users_on_role_id  (role_id)
#
class User < ApplicationRecord
  has_secure_password
  belongs_to :role

  validates :login, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  validates :password, presence: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :middle_name, presence: true, length: { maximum: 50 }

  def failed_attempt!
    p 'failed_attempt'
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end
end
