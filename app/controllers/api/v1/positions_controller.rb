class Api::V1::PositionsController < Api::ApiController
  def index
    positions = Position.all
    render json: { positions: PositionSerializer.new(positions) }, status: :ok
  end
end
