# == Schema Information
#
# Table name: positions
#
#  id          :integer          not null, primary key
#  lock        :boolean          not null
#  name        :string           not null
#  sort_level  :integer          default(0), not null
#  users_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Position < ApplicationRecord
  include Workable

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
end
