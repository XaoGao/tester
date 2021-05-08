class Api::V1::PositionsController < Api::ApiController
  before_action :authorized

  def index
    positions = Position.all_except_default.order(:sort_level)
    render_ok({ positions: PositionSerializer.new(positions) })
  end

  def create
    position = Position.new position_params
    position.lock = false
    if position.save
      render_ok({ position: PositionSerializer.new(position) })
    else
      render_bad_request(position.errors.full_messages)
    end
  end

  def update
    position = Position.find_by(id: params[:id])
    render_bad_request 'Должность не найдена!' and return unless position.present?

    if position.update position_params
      render_ok({ position: PositionSerializer.new(position) })
    else
      render_bad_request(position.errors.full_messages)
    end
  end

  def destroy
    position = Position.find_by(id: params[:id])
    render_bad_request 'Должность не найдена!' and return unless position.present?

    if position.update(lock: true)
      render_no_content
    else
      render_bad_request(position.errors.full_messages)
    end
  end

  private

  def position_params
    params.require(:position).permit(:name, :sort_level, :lock)
  end
end
