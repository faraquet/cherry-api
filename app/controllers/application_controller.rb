class ApplicationController < ActionController::API
  include TokenAuthenticatable
  include RecordAccessible
end
