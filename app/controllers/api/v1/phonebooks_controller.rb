class Api::V1::PhonebooksController < Api::ApiController
  before_action :authorized

  def index
    deaprtments = Department.includes(:users).includes(users: [:position, :phone]).all_except_default.active
    render_ok(phonebook: PhonebookSerializer.new(deaprtments))
  end
end
