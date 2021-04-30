# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  failed_attempt  :integer          default(0), not null
#  first_name      :string           default(""), not null
#  last_name       :string           default(""), not null
#  login           :string           default(""), not null
#  middle_name     :string           default(""), not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role_id         :integer
#
# Indexes
#
#  index_users_on_role_id  (role_id)
#
FactoryBot.define do
  factory :user do
    first_name     { Faker::Name.first_name }
    last_name      { Faker::Name.last_name }
    middle_name    { Faker::Name.middle_name }
    login          { 'doctor' }
    password       { 'password' }
    failed_attempt { 0 }
    association :role
  end
end
