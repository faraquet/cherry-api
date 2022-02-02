# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.successful?
      render(json: command.result)
    else
      render(json: { error: command.errors }, status: :unauthorized)
    end
  end
end
