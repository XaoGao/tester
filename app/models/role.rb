# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  lock       :boolean          default(FALSE), not null
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}

  scope :doctor, -> { find_by(name: 'doctor')}
end
