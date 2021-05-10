# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  failed_attempt  :integer          default(0), not null
#  first_name      :string           default(""), not null
#  last_name       :string           default(""), not null
#  lock            :boolean          default(FALSE), not null
#  login           :string           default(""), not null
#  middle_name     :string           default(""), not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  department_id   :integer          not null
#  phone_id        :integer
#  position_id     :integer          not null
#  role_id         :integer
#
# Indexes
#
#  index_users_on_department_id  (department_id)
#  index_users_on_phone_id       (phone_id)
#  index_users_on_position_id    (position_id)
#  index_users_on_role_id        (role_id)
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#  phone_id       (phone_id => phones.id)
#  position_id    (position_id => positions.id)
#
FactoryBot.define do
  factory :user do
    first_name     { Faker::Name.first_name }
    last_name      { Faker::Name.last_name }
    middle_name    { Faker::Name.middle_name }
    login          { Faker::Internet.username }
    password       { 'password' }
    failed_attempt { 0 }
    lock           { false }
    association :role
    association :position
    association :department
  end
end
