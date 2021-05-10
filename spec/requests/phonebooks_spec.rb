require 'rails_helper'

RSpec.describe 'Phonebooks', type: :request do
  describe 'GET /index' do
    context 'get a phonebooks' do
      let(:department) { create(:department) }
      let(:position) { create(:position) }
      let(:role) { create(:role) }
      let!(:users) { create_list(:user, 3, department: department, position: position, role: role) }
      it 'unauthorized request' do
        get '/api/v1/phonebooks'
        expect(response).to have_http_status(:unauthorized)
      end

      it 'success' do
        get '/api/v1/phonebooks', headers: authenticated_header(users.first)
        expect(response.body).to match('phonebook')
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
