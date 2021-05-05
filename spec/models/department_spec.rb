# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  lock       :boolean          default(FALSE), not null
#  name       :string           not null
#  sort_level :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'validates' do
    context 'require field' do
      it { should validate_presence_of(:name) }
    end
    context 'relationship' do
      it { should have_many(:users) }
    end
    context 'unique' do
      let!(:department) { create(:department) }
      it { should validate_uniqueness_of(:name).case_insensitive }
    end
    context 'length max' do
      it { should validate_length_of(:name).is_at_most(50) }
    end
  end
  describe 'mathods' do
    context 'default' do
      it 'empty table' do
        department = Department.default
        expect(department.name).to eq('default')
      end
      let!(:department) { create(:department) }
      it 'empty table' do
        department_default = Department.default
        expect(department_default.name).to eq('default')
      end
    end
    context '.all_except_default' do
      let!(:departments) { create_list(:department, 2) }
      it 'success' do
        default_department = create(:department, name: 'default')
        departments_from_repo = Department.all_except_default
        expect(departments_from_repo.count).to eq(2)
        expect(departments_from_repo.include?(default_department)).to be false
      end
    end
  end
end
