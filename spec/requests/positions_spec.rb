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
        user = create(:user, position: positions.first)
        get '/api/v1/positions', headers: authenticated_header(user)
        expect(JSON.parse(response.body)['positions']['data'].count).to eq(3)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT /update' do
    context 'update position' do
      let!(:position_repo) { create(:position, name: 'before update', sort_level: 1) }
      it 'unauthorized request' do
        put "/api/v1/positions/#{position_repo.id}"
        expect(response).to have_http_status(:unauthorized)
      end
      it 'position not found' do
        user = create(:user, position: position_repo)
        put '/api/v1/positions/100', headers: authenticated_header(user), params: { position: { name: 'test', sort_level: 2 }}
        expect(response.body).to match('Должность не найдена!')
        expect(response).to have_http_status(:bad_request)
      end
      it 'error when update' do
        user = create(:user, position: position_repo)
        put "/api/v1/positions/#{position_repo.id}", headers: authenticated_header(user), params: { position: { name: '', sort_level: 2 }}
        expect(response.body).to match("Name can't be blank")
        expect(response).to have_http_status(:bad_request)
      end
      it 'success' do
        user = create(:user, position: position_repo)
        put "/api/v1/positions/#{position_repo.id}", headers: authenticated_header(user), params: { position: { name: 'test', sort_level: 2 }}
        expect(JSON.parse(response.body)['position']['data']['attributes']['name']).to eq('test')
        expect(JSON.parse(response.body)['position']['data']['attributes']['sortLevel']).to eq(2)
        expect(response).to have_http_status(:ok)
      end
    end
  end
  describe 'POST /create' do
    context 'create position' do
      let!(:position_repo) { create(:position, name: 'old', sort_level: 1) }
      it 'unauthorized request' do
        post '/api/v1/positions/'
        expect(response).to have_http_status(:unauthorized)
      end
      it 'error when create' do
        user = create(:user, position: position_repo)
        post '/api/v1/positions', headers: authenticated_header(user), params: { position: { sort_level: 2 }}
        expect(response.body).to match("Name can't be blank")
        expect(response).to have_http_status(:bad_request)
      end
      it 'success' do
        user = create(:user, position: position_repo)
        post '/api/v1/positions/', headers: authenticated_header(user), params: { position: { name: 'new', sort_level: 2 }}
        expect(JSON.parse(response.body)['position']['data']['attributes']['name']).to eq('new')
        expect(JSON.parse(response.body)['position']['data']['attributes']['sortLevel']).to eq(2)
        expect(Position.all.count).to eq(2)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
