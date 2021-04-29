module JwtService
  module Encoder
    DEFAULT_ALGORITHM = 'HS256'.freeze
    class << self
      def encode(user)
        JWT.encode generate_payload(user), secret_key, DEFAULT_ALGORITHM
      end

      def decode(token)
        JWT.decode token, secret_key, true, { algorithm: DEFAULT_ALGORITHM }
      end

      private

      def secret_key
        Rails.application.secret_key_base
      end

      def generate_payload(user)
        exp = Time.now.to_i + 4 * 3600
        { id: user.id, fullName: user.full_name, role: user.role.id, exp: exp }
      end
    end
  end
end
