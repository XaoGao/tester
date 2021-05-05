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
FactoryBot.define do
  factory :department do
    name       { Faker::Name.unique.name  }
    lock       { false }
    sort_level { 0 }
  end
end
