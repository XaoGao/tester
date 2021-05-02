# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  lock       :boolean          default(FALSE), not null
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validates' do
    context 'require fields' do
      it { should validate_presence_of(:name) }
    end
    context 'max length' do
      it { should validate_length_of(:name).is_at_most(50) }
    end
    context 'unique fields' do
      it { should validate_uniqueness_of(:name).case_insensitive }
    end
  end
  describe 'methods' do
    context '.doctor' do
      let!(:role) { create(:role, name: 'doctor') }
      it 'found doctor role' do
        role = Role.doctor

        expect(role.name).to eq('doctor')
      end
    end
  end
end
