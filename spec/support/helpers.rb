module Helpers
  def authenticated_header(user)
    token = JwtService::Encoder.encode(user)
    { 'Authorization': "Bearer #{token}" }
  end
end
