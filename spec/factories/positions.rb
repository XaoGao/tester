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
FactoryBot.define do
  factory :position do
    name { Faker::Coffee.origin }
    lock { false }
  end
end
