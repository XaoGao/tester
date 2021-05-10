# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  lock       :boolean          default(FALSE), not null
#  number     :string           default(""), not null
#  slug       :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Phone, type: :model do
  describe 'validate' do
    context 'require field' do
      it { should validate_presence_of(:number) }
    end

    context 'unique' do
      let!(:phone) { create(:phone) }
      it { should validate_uniqueness_of(:number).case_insensitive }
    end
    context 'length max' do
      it { should validate_length_of(:number).is_at_most(50) }
    end
  end

  describe '.generate_slug' do
    context 'create new a phone' do
      let(:phone) { build(:phone) }
      it 'before save' do
        expect(phone.slug).to be_nil
      end
      it 'after save' do
        phone.save
        expect(phone.slug).to eq(phone.generate_slug)
      end
    end
    context 'update a number' do
      let(:phone) { create(:phone) }
      it 'after update' do
        phone.update(number: '8 932 41-42-711')
        expect(phone.slug).to eq('89324142711')
      end
    end
  end
end
