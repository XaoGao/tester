# == Schema Information
#
# Table name: departments
#
#  id          :integer          not null, primary key
#  lock        :boolean          default(FALSE), not null
#  name        :string           not null
#  sort_level  :integer          not null
#  users_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Department < ApplicationRecord
  include Workable
  include Activeable

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
end
