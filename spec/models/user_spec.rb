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
#  role_id         :integer
#
# Indexes
#
#  index_users_on_role_id  (role_id)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "require field" do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:middle_name) }
      it { should validate_presence_of(:login) }
      it { should validate_presence_of(:password) }
    end

    context "length max" do
      it { should validate_length_of(:first_name).is_at_most(50) }
      it { should validate_length_of(:last_name).is_at_most(50) }
      it { should validate_length_of(:middle_name).is_at_most(50) }
      it { should validate_length_of(:login).is_at_most(50) }
      it { should validate_length_of(:password).is_at_most(50) }
    end

    context "unique" do
      it { should validate_uniqueness_of(:login).case_insensitive }
    end
  end

  describe "methods" do
    context ".full_name" do
      let(:user) { build(:user, first_name: 'Jon', last_name: 'James', middle_name: 'Josh') }
      it "full name user" do
        expect(user.full_name).to eq("James Jon Josh")
      end
    end

    context ".faile_attempt!" do
      let(:user) { build(:user, failed_attempt: 0) }
      it "cross 1 faile_attempt" do
        user.update(failed_attempt: 0)
        user.faile_attempt!
        expect(user.failed_attempt).to eq(1)
        expect(user.lock).to be false
      end
      it "cross 2 faile_attempt" do
        user.update(failed_attempt: 1)
        user.faile_attempt!
        expect(user.failed_attempt).to eq(2)
        expect(user.lock).to be false
      end
      it "cross 3 faile_attempt" do
        user.update(failed_attempt: 2)
        user.faile_attempt!
        expect(user.failed_attempt).to eq(3)
        expect(user.lock).to be false
      end
      it "cross 4 faile attempt" do
        user.update(failed_attempt: 3)
        user.faile_attempt!
        expect(user.failed_attempt).to eq(3)
        expect(user.lock).to be true
      end
    end
  end
end
