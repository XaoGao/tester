class Api::V1::PositionsController < Api::ApiController
  before_action :authorized

  def index
    positions = Position.all_except_default
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
    if position.present?
      if position.update position_params
        render_ok({ position: PositionSerializer.new(position) })
      else
        render_bad_request(position.errors.full_messages)
      end
    else
      render_bad_request 'Должность не найдена!'
    end
  end

  private

  def position_params
    params.require(:position).permit(:name, :sort_level, :lock)
  end
end
