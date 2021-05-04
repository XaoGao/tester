require 'rails_helper'

def authenticated_header(user)
  token = JwtService::Encoder.encode(user)
  { 'Authorization': "Bearer #{token}" }
end

RSpec.describe 'Positions', type: :request do
  describe 'GET /index' do
    context 'get positions' do
      let!(:positions) { create_list(:position, 3) }
      it 'unauthorized request' do
        get '/api/v1/positions'
        expect(response).to have_http_status(:unauthorized)
      end
      it 'success' do
        user = create(:user)
        get '/api/v1/positions', headers: authenticated_header(user)
        # TODO: error !!!
        expect(JSON.parse(response.body)['positions']['data'].count).to eq(4)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
