class Api::V1::RegistrationController < Api::ApiController
  def create
    user = User.new user_params
    role = Role.find_by(name: params[:registration][:role])
    position = Position.default
    if role.blank?
      render_bad_request 'Нет необходимой роли, обратитесь к администратору!' and return
    end
    user.role = role
    user.position = position
    if user.save
      render_no_content
    else
      render_bad_request user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:registration).permit(:first_name, :last_name, :middle_name, :password, :login)
  end
end
