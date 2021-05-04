module Renderable
  extend ActiveSupport::Concern

  included do
    def render_ok(response_body = {})
      render json: response_body, status: :ok
    end

    def render_no_content
      render json: {}, status: :no_content
    end

    def render_bad_request(message)
      render json: { error: message }, status: :bad_request
    end
  end
end
