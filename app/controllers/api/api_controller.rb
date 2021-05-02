class Api::ApiController < ApplicationController
  def render_ok(response_body = {})
    render json: response_body, status: :ok
  end

  def render_no_content
    render json: {}, status: :no_content
  end

  def render_bad_request(response_body = {})
    render json: response_body, status: :bad_request
  end
end
