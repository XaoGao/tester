class Api::V1::RegistrationController < Api::ApiController
  def create
    user = User.new user_params
    user.role = Role.first
    if user.save
      render_no_content
    else
      render_bad_request({ error: user.errors.full_messages })
    end
  end

  private

  def user_params
    params.require(:registration).permit(:first_name, :last_name, :middle_name, :password, :login)
  end
end
