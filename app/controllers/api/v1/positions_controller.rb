class Api::V1::PositionsController < Api::ApiController
  before_action :authorized

  def index
    positions = Position.all
    render json: { positions: PositionSerializer.new(positions) }, status: :ok
  end
end
