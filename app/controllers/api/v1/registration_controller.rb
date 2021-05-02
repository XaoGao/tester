class Api::V1::RegistrationController < Api::ApiController
  def create
    user = User.new user_params
    result = RegistrationService::Create.new.call(user, params[:registration][:role])
    if result.valid?
      render_no_content
    else
      render_bad_request result.error
    end
  end

  private

  def user_params
    params.require(:registration).permit(:first_name, :last_name, :middle_name, :password, :login)
  end
end
