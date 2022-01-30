class UnauthorizedException < StandardError; end

module TokenAuthenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request

    attr_reader :current_user

    rescue_from UnauthorizedException, with: ->{ render(json: { error: "Unauthorized" }, status: 401) }
  end

  private

  def authenticate_request
    return unless ActiveRecord::Type::Boolean.new.deserialize(ENV["TOKEN_AUTHENTICATABLE"])

    @current_user = AuthorizeApiRequest.call(request.headers).result

    raise UnauthorizedException unless @current_user
  end
end
