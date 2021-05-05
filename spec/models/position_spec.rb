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
require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'validates' do
    context 'require field' do
      it { should validate_presence_of(:name) }
    end
    context 'relationship' do
      it { should have_many(:users) }
    end
    context 'unique' do
      let!(:position) { create(:position) }
      it { should validate_uniqueness_of(:name).case_insensitive }
    end
    context 'length max' do
      it { should validate_length_of(:name).is_at_most(50) }
    end
  end
  describe 'mathods' do
    context 'default' do
      it 'empty table' do
        position = Position.default
        expect(position.name).to eq('default')
      end
      let!(:position) { create(:position) }
      it 'empty table' do
        position_default = Position.default
        expect(position_default.name).to eq('default')
      end
    end
    context '.all_except_default' do
      let!(:positions) { create_list(:position, 2) }
      it 'success' do
        default_position = create(:position, name: 'default')
        positions_from_repo = Position.all_except_default
        expect(positions_from_repo.count).to eq(2)
        expect(positions_from_repo.include?(default_position)).to be false
      end
    end
  end
end
