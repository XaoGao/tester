require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'POST /login' do
    URL = '/api/v1/login'.freeze
    context 'when logged in' do
      let!(:user) { create(:user, login: 'doctor', password: 'password') }
      it 'success' do
        post URL, params: { login: 'doctor', password: 'password' }
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).size).to eq(1)
        expect(JSON.parse(response.body).include?('token')).to be true
      end
      it "dosen't exist user" do
        post URL, params: { login: 'doctor1', password: 'password' }
        expect(response.status).to eq(400)
      end
      it 'user is lock' do
        user.update(lock: true)
        post URL, params: { login: 'doctor', password: 'password' }
        expect(response.status).to eq(400)
      end
      it 'wrong password' do
        post URL, params: { login: 'doctor', password: 'password1' }
        expect(response.status).to eq(400)
      end
    end
  end
end
