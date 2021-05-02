require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'POST /create' do
    context 'when created user' do
      let!(:role) { create(:role, name: 'doctor') }
      it 'success' do
        post '/api/v1/registration', params: { registration: { first_name: 'jon', last_name: 'josh', middle_name: 'don', password: 'password', login: 'login', role: 'doctor' }}

        expect(response.status).to eq(204)
      end
      it 'role doctor have not found' do
        post '/api/v1/registration', params: { registration: { first_name: 'jon', last_name: 'josh', middle_name: 'don', password: 'password', login: 'login', role: '-' }}

        expect(response.status).to eq(400)
        expect(JSON.parse(response.body).include?('error')).to be true
        expect(response.body).to match('Нет необходимой роли, обратитесь к администратору!')
      end
      it 'error empty first_name' do
        post '/api/v1/registration', params: { registration: { last_name: 'josh', middle_name: 'don', password: 'password', login: 'login', role: 'doctor' } }

        expect(response.status).to eq(400)
        expect(JSON.parse(response.body).include?('error')).to be true
        expect(response.body).to match("First name can't be blank")
      end
      it 'error empty last_name' do
        post '/api/v1/registration', params: { registration: { first_name: 'jon', middle_name: 'don', password: 'password', login: 'login', role: 'doctor' } }

        expect(response.status).to eq(400)
        expect(JSON.parse(response.body).include?('error')).to be true
        expect(response.body).to match("Last name can't be blank")
      end
      it 'error empty middle_name' do
        post '/api/v1/registration', params: { registration: { first_name: 'jon', last_name: 'josh', password: 'password', login: 'login', role: 'doctor' } }

        expect(response.status).to eq(400)
        expect(JSON.parse(response.body).include?('error')).to be true
        expect(response.body).to match("Middle name can't be blank")
      end
      it 'error empty password' do
        post '/api/v1/registration', params: { registration: { first_name: 'jon', last_name: 'josh', middle_name: 'don', login: 'login', role: 'doctor' } }

        expect(response.status).to eq(400)
        expect(JSON.parse(response.body).include?('error')).to be true
        expect(response.body).to match("Password can't be blank")
      end
      it 'error empty login' do
        post '/api/v1/registration', params: { registration: { first_name: 'jon', last_name: 'josh', middle_name: 'don', password: 'password', role: 'doctor' } }

        expect(response.status).to eq(400)
        expect(JSON.parse(response.body).include?('error')).to be true
        expect(response.body).to match("Login can't be blank")
      end
    end
  end
end
