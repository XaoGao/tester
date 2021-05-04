module Authorizeable
  extend ActiveSupport::Concern

  included do
    def authorized
      render json: { error: 'Пользователь должен авторизоваться' }, status: :unauthorized unless logged_in?
    end
  end

  private

  def authorization_header
    request.headers['Authorization']
  end

  def token
    authorization_header.split(' ').compact.last
  end

  def decoded
    JwtService::Encoder.decode token
  rescue StandardError => e
    nil
  end

  def logged_in?
    !!user_from_token
  end

  def user_from_token
    return unless decoded

    user_id = decoded[0]['id']
    @current_user = User.find(user_id)
  end
end
