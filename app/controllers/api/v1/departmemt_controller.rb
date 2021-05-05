class Api::V1::DepartmemtController < Api::ApiController
  before_action :authorized

  def index
    departments = Department.all_except_default
    render_ok({ positions: DepartmentSerializer.new(departments) })
  end
end
