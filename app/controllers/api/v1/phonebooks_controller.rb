class Api::V1::PhonebooksController < Api::ApiController
  before_action :authorized

  def index
    deaprtments = Department.includes(:users).active
    render_ok(phonebook: PhonebookSerializer.new(deaprtments))
  end
end
