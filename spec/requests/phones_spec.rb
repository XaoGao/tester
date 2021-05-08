require 'rails_helper'

RSpec.describe 'Phones', type: :request do
  describe 'GET /index' do
    context 'get all phones' do
      let!(:phones) { create_list(:phone, 2) }
      let(:user) { create(:user) }

      it 'success' do
        get '/api/v1/phones', headers: authenticated_header(user)
        expect(response).to have_http_status(:ok)
        expect(response_body).to have_key('phones')
        expect(response_body['phones']['data'].first['attributes']['number']).to match(phones.first.number)
        expect(response_body).not_to be_empty
      end
    end
  end

  describe 'POST /create' do
    context 'create a new phone' do
      let(:user) { create(:user) }
      let(:phone_params) { { number: '8 932 40 04 754' } }

      it 'success' do
        post '/api/v1/phones', headers: authenticated_header(user), params: { phone: phone_params }
        expect(Phone.all.count).to eq(1)
        expect(response).to have_http_status(:no_content)
      end

      it 'return error number is missing' do
        phone_params[:number] = ''
        post '/api/v1/phones', headers: authenticated_header(user), params: { phone: phone_params }
        expect(response.body).to match('Ошибка при добавлении номера')
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'PUT /create' do
    context 'update a phone' do
      let(:phone) { create(:phone) }
      let(:user) { create(:user) }
      let(:phone_params) { { number: '8 932 40 04 754' } }

      it 'success' do
        put "/api/v1/phones/#{phone.id}", headers: authenticated_header(user), params: { phone: phone_params }
        expect(response.body).to match('8 932 40 04 754')
        expect(response).to have_http_status(:ok)
      end

      it 'return error phone not exist' do
        put '/api/v1/phones/100', headers: authenticated_header(user), params: { phone: phone_params }
        expect(response.body).to match('Нет телефона с id')
        expect(response).to have_http_status(:bad_request)
      end

      it 'return error number is missing' do
        phone_params[:number] = ''
        put "/api/v1/phones/#{phone.id}", headers: authenticated_header(user), params: { phone: phone_params }
        expect(response.body).to match('Ошибка при обновлении номера')
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
