class Api::V1::SessionController < Api::ApiController
  def create
    user = User.find_by(login: params[:login])
    if user.nil?
      render_bad_request 'Не верный логин/пароль' and return
    end

    unless user.authenticate(params[:password])
      user.failed_attempt!
      render_bad_request 'Не верный логин/пароль' and return
    end

    token = JwtService::Encoder.encode(user)
    render json: { token: token }, status: :ok
  end

  def destroy; end
end
