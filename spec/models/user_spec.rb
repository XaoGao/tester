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
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
