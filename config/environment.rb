# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tap::Application.initialize!

Tap::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    :user_name => "noreply@tangletech.com",
    :password => "BeastieB0ys",
    :authentication => "plain",
    :enable_starttls_auto => true
  }
end
