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
FactoryBot.define do
  factory :position do
    name       { Faker::Name.unique.first_name }
    lock       { false }
    sort_level { 0 }
  end
end
