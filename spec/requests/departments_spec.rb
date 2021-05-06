require 'rails_helper'

RSpec.describe 'Departments', type: :request do
  describe 'GET /index' do
    context 'get departments' do
      let(:departments) { create_list(:department, 3) }
      let(:user) { create(:user, department: departments.first) }
      it 'unauthorized request' do
        get '/api/v1/departments'
        expect(response).to have_http_status(:unauthorized)
      end
      it 'success' do
        get '/api/v1/departments', headers: authenticated_header(user)
        expect(response_body['departments']['data'].count).to eq(3)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT /update' do
    context 'update department' do
      let(:department_repo) { create(:department, name: 'before update', sort_level: 1) }
      let(:user) { create(:user, department: department_repo) }
      let(:department_params) { { name: 'test', sort_level: 2 } }
      it 'unauthorized request' do
        put "/api/v1/departments/#{department_repo.id}"
        expect(response).to have_http_status(:unauthorized)
      end
      it 'department not found' do
        put '/api/v1/departments/100', headers: authenticated_header(user), params: { department: department_params }
        expect(response.body).to match('Отдел не найден!')
        expect(response).to have_http_status(:bad_request)
      end
      it 'return error when update is missing name' do
        department_params[:name] = ''
        put "/api/v1/departments/#{department_repo.id}", headers: authenticated_header(user), params: { department: department_params }
        expect(response.body).to match("Name can't be blank")
        expect(response).to have_http_status(:bad_request)
      end
      it 'success' do
        put "/api/v1/departments/#{department_repo.id}", headers: authenticated_header(user), params: { department: department_params }
        attributes = response_body['department']['data']['attributes']
        expect(attributes['name']).to eq('test')
        expect(attributes['sortLevel']).to eq(2)
        expect(response).to have_http_status(:ok)
      end
    end
  end
  describe 'POST /create' do
    context 'create department' do
      let(:department_repo) { create(:department, name: 'old', sort_level: 1) }
      let(:user) { create(:user, department: department_repo) }
      it 'unauthorized request' do
        post '/api/v1/departments/'
        expect(response).to have_http_status(:unauthorized)
      end
      it 'error when create' do
        post '/api/v1/departments', headers: authenticated_header(user), params: { department: { sort_level: 2 }}
        expect(response.body).to match("Name can't be blank")
        expect(response).to have_http_status(:bad_request)
      end
      it 'success' do
        post '/api/v1/departments/', headers: authenticated_header(user), params: { department: { name: 'new', sort_level: 2 }}
        attributes = response_body['department']['data']['attributes']
        expect(attributes['name']).to eq('new')
        expect(attributes['sortLevel']).to eq(2)
        expect(Department.all.count).to eq(2)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
