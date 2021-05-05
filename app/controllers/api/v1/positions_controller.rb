class Api::V1::PositionsController < Api::ApiController
  before_action :authorized

  def index
    positions = Position.all_except_default
    render_ok({ positions: PositionSerializer.new(positions) })
  end
end
