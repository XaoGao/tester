module RequestHelper
  def response_body
    JSON.parse(response.body)
  end

  def authenticated_header(user)
    token = JwtService::Encoder.encode(user)
    { 'Authorization': "Bearer #{token}" }
  end
end
