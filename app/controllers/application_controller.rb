class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  # HTTP Basic Authentication to access all routes
  http_basic_authenticate_with(
    name:     Settings.app_username, 
    password: Settings.app_password
  )
end
