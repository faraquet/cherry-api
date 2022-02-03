# frozen_string_literal: true

module RecordAccessible
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: -> { render(json: { error: 'Not Found' }, status: :not_found) }
    rescue_from ActiveRecord::RecordInvalid, with: -> { render(json: { error: 'Bad Request' }, status: :bad_request) }
  end
end
