require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'POST /login' do
    context 'when logged in' do
      let!(:user) { create(:user, login: 'doctor', password: 'password') }
      it 'success' do
        post '/api/v1/login', params: { login: 'doctor', password: 'password' }
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).size).to eq(1)
        expect(JSON.parse(response.body).include?('token')).to be true
      end
      it "dosen't exist user" do
        post '/api/v1/login', params: { login: 'doctor1', password: 'password' }
        expect(response.status).to eq(400)
      end
      it 'user is lock' do
        user.update(lock: true)
        post '/api/v1/login', params: { login: 'doctor', password: 'password' }
        expect(response.status).to eq(400)
      end
      it 'wrong password' do
        post '/api/v1/login', params: { login: 'doctor', password: 'password1' }
        expect(response.status).to eq(400)
      end
    end
  end
end
