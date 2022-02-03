# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request

  before_action only: :create,
                unless: -> { ActiveRecord::Type::Boolean.new.deserialize(ENV['SELF_REGISTRATION_AVAILABLE']) } do
    render json: { error: 'Self registration is not available' }, status: :unprocessable_entity
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { error: "User can't be created", details: @user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
