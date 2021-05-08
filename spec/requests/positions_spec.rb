require 'rails_helper'

RSpec.describe 'Positions', type: :request do
  describe 'GET /index' do
    context 'get positions' do
      let(:positions) { create_list(:position, 3) }
      let(:user) { create(:user, position: positions.first) }
      it 'unauthorized request' do
        get '/api/v1/positions'
        expect(response).to have_http_status(:unauthorized)
      end
      it 'success' do
        get '/api/v1/positions', headers: authenticated_header(user)
        expect(response_body['positions']['data'].count).to eq(3)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT /update' do
    context 'update position' do
      let(:position_repo) { create(:position, name: 'before update', sort_level: 1) }
      let(:user) { create(:user, position: position_repo) }
      it 'unauthorized request' do
        put "/api/v1/positions/#{position_repo.id}"
        expect(response).to have_http_status(:unauthorized)
      end
      it 'position not found' do
        put '/api/v1/positions/100', headers: authenticated_header(user), params: { position: { name: 'test', sort_level: 2 }}
        expect(response.body).to match('Должность не найдена!')
        expect(response).to have_http_status(:bad_request)
      end
      it 'error when update' do
        put "/api/v1/positions/#{position_repo.id}", headers: authenticated_header(user), params: { position: { name: '', sort_level: 2 }}
        expect(response.body).to match("Name can't be blank")
        expect(response).to have_http_status(:bad_request)
      end
      it 'success' do
        put "/api/v1/positions/#{position_repo.id}", headers: authenticated_header(user), params: { position: { name: 'test', sort_level: 2 }}
        attributes = response_body['position']['data']['attributes']
        expect(attributes['name']).to eq('test')
        expect(attributes['sortLevel']).to eq(2)
        expect(response).to have_http_status(:ok)
      end
    end
  end
  describe 'POST /create' do
    context 'create position' do
      let(:position_repo) { create(:position, name: 'old', sort_level: 1) }
      let(:user) { create(:user, position: position_repo) }
      it 'unauthorized request' do
        post '/api/v1/positions/'
        expect(response).to have_http_status(:unauthorized)
      end
      it 'error when create' do
        post '/api/v1/positions', headers: authenticated_header(user), params: { position: { sort_level: 2 }}
        expect(response.body).to match("Name can't be blank")
        expect(response).to have_http_status(:bad_request)
      end
      it 'success' do
        post '/api/v1/positions/', headers: authenticated_header(user), params: { position: { name: 'new', sort_level: 2 }}
        attributes = response_body['position']['data']['attributes']
        expect(attributes['name']).to eq('new')
        expect(attributes['sortLevel']).to eq(2)
        expect(Position.all.count).to eq(2)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'lock a position' do
      let(:position_repo) { create(:position, lock: false) }
      let(:user) { create(:user, position: position_repo) }
      it 'unauthorized request' do
        delete "/api/v1/positions/#{position_repo.id}"
        expect(response).to have_http_status(:unauthorized)
      end
      it 'position have not found' do
        delete '/api/v1/positions/2', headers: authenticated_header(user)
        expect(response.body).to match('Должность не найдена!')
        expect(response).to have_http_status(:bad_request)
      end
      it 'success' do
        delete "/api/v1/positions/#{position_repo.id}", headers: authenticated_header(user)
        expect(Position.find(position_repo.id).lock).to be true
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
