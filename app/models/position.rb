# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  lock       :boolean          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Position < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }

  def self.default
    default_position = find_by(name: 'default')
    create!(name: 'default', lock: false) if default_position.blank?
    find_by(name: 'default')
  end
end
