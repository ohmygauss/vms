module Authenticator
  module_function

  def http_login
    page.driver.header('Authorization',
      ActionController::HttpAuthentication::Basic.encode_credentials(
        Settings.app_username,
        Settings.app_password
      )
    )
  end
end