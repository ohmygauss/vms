module Settings
  module_function

  def app_username
    ENV['APP_USER'] || 'test_user'
  end

  def app_password
    ENV['APP_PASS'] || 'test_pass'
  end
end