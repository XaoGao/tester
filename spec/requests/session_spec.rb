require 'rails_helper'

URL = '/api/v1/login'.freeze

RSpec.describe 'Sessions', type: :request do
  describe 'POST /login' do
    context 'when logged in' do
      let!(:user) { create(:user, login: 'doctor', password: 'password') }
      let(:session_params) { { login: 'doctor', password: 'password' } }
      it 'success' do
        post URL, params: session_params
        expect(response).to have_http_status(:ok)
        expect(response_body.size).to eq(1)
        expect(response_body.include?('token')).to be true
      end
      it "dosen't exist user" do
        session_params[:login] = '-'
        post URL, params: session_params
        expect(response).to have_http_status(:bad_request)
      end
      it 'user is lock' do
        user.update(lock: true)
        post URL, params: session_params
        expect(response).to have_http_status(:bad_request)
      end
      it 'wrong password' do
        session_params[:password] = '-'
        post URL, params: session_params
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
