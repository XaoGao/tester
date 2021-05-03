require 'rails_helper'

RSpec.describe 'Positions', type: :request do
  describe 'GET /index' do
    context 'get positions' do
      let!(:positions) { create_list(:position, 3) }
      it 'success' do
        get '/api/v1/positions'
        expect(JSON.parse(response.body)['positions']['data'].count).to eq(3)
        expect(response.status).to eq(200)
      end
    end
  end
end
