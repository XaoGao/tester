class Api::V1::DepartmentsController < Api::ApiController
  before_action :authorized

  def index
    departments = Department.all_except_default
    render_ok({ departments: DepartmentSerializer.new(departments) })
  end

  def create
    department = Department.new department_params
    department.lock = false
    if department.save
      render_ok({ department: DepartmentSerializer.new(department) })
    else
      render_bad_request(department.errors.full_messages)
    end
  end

  def update
    department = Department.find_by(id: params[:id])
    if department.present?
      if department.update department_params
        render_ok({ department: DepartmentSerializer.new(department) })
      else
        render_bad_request(department.errors.full_messages)
      end
    else
      render_bad_request 'Отдел не найден!'
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :sort_level, :lock)
  end
end
