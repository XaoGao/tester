# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
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
    
  end
end
