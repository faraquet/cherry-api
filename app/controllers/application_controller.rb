class ApplicationController < ActionController::API
  include TokenAuthenticatable if ActiveRecord::Type::Boolean.new.deserialize(ENV["TOKEN_AUTHENTICATABLE"])
  include RecordAccessible
end
