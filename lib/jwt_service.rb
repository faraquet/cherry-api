class JwtService
  class << self
    def encode(payload:, expires_at: 24.hours.from_now)
      payload[:exp] = expires_at.to_i

      {
        auth_token: JWT.encode(payload, Rails.application.secrets.secret_key_base),
        expires_at: expires_at,
      }
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new(body)
    rescue JWT::DecodeError, JWT::ExpiredSignature
      return nil
    end
  end
end
