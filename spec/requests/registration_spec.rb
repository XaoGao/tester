require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'POST /create' do
    context 'when created user' do
      let!(:role) { create(:role, name: 'doctor') }
      let(:registration) { { first_name: 'jon', last_name: 'josh', middle_name: 'don', password: 'password', login: 'login', role: 'doctor' } }
      it 'create a new user' do
        post '/api/v1/registration', params: { registration: registration }

        expect(response).to have_http_status(:no_content)
      end
      it 'return error when role doctor is not exist' do
        registration[:role] = '-'
        post '/api/v1/registration', params: { registration: registration }

        expect(response).to have_http_status(:bad_request)
        expect(response_body.include?('error')).to be true
        expect(response.body).to match('Нет необходимой роли, обратитесь к администратору!')
      end
      it 'return error when first_name is missing' do
        registration.delete(:first_name)
        post '/api/v1/registration', params: { registration: registration }

        expect(response).to have_http_status(:bad_request)
        expect(response_body.include?('error')).to be true
        expect(response.body).to match("First name can't be blank")
      end
      it 'return error when last_name is missing' do
        registration.delete(:last_name)
        post '/api/v1/registration', params: { registration: registration }

        expect(response).to have_http_status(:bad_request)
        expect(response_body.include?('error')).to be true
        expect(response.body).to match("Last name can't be blank")
      end
      it 'return error when middle_name is missing' do
        registration.delete(:middle_name)
        post '/api/v1/registration', params: { registration: registration }

        expect(response).to have_http_status(:bad_request)
        expect(response_body.include?('error')).to be true
        expect(response.body).to match("Middle name can't be blank")
      end
      it 'return error when password is missing' do
        registration.delete(:password)
        post '/api/v1/registration', params: { registration: registration }

        expect(response).to have_http_status(:bad_request)
        expect(response_body.include?('error')).to be true
        expect(response.body).to match("Password can't be blank")
      end
      it 'return error when login is missing' do
        registration.delete(:login)
        post '/api/v1/registration', params: { registration: registration }

        expect(response).to have_http_status(:bad_request)
        expect(response_body.include?('error')).to be true
        expect(response.body).to match("Login can't be blank")
      end
    end
  end
end
