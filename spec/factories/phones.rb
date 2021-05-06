# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  number     :string           default(""), not null
#  slug       :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :phone do
    number { Faker::PhoneNumber.cell_phone }
    slug   { nil }
  end
end
