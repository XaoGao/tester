class Api::ApiController < ApplicationController
  def render_ok(response_body = {})
    render json: response_body, status: :ok
  end

  def render_no_content
    render json: {}, status: :no_content
  end

  def render_bad_request(message)
    render json: { error: message }, status: :bad_request
  end

  def authorized
    render json: { error: 'Пользователь должен авторизоваться' }, status: :unauthorized unless logged_in?
  end

  private

  def authorization_header
    request.headers['Authorization']
  end

  def token
    authorization_header.split(' ').compact.last
  end

  def decoded
    begin
      payload = JwtService::Encoder.decode token
    rescue => exception
      nil
    end
  end

  def logged_in?
    !!user_from_token
  end

  def user_from_token
    if decoded
      user_id = decoded[0]["id"]
      @current_user = User.find(user_id)
    end
  end
end
