class RegistrationService::Create < Service
  def call(user, role_name)
    role = Role.find_by(name: role_name)
    return error(nil, 'Нет необходимой роли, обратитесь к администратору!') if role.blank?

    user.role = role
    user.position = Position.default
    user.department = Department.default

    save(user)
  end

  private

  def save(user)
    if user.save
      success(user)
    else
      error(nil, user.errors.full_messages)
    end
  end
end
