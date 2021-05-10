# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  lock       :boolean          default(FALSE), not null
#  number     :string           default(""), not null
#  slug       :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Phone < ApplicationRecord
  has_many :users

  validates :number, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  before_save :generate_slug

  def generate_slug
    self.slug = number.gsub(/[^0-9,.]/, "")
  end
end
