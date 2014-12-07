if Rails.application.secrets.airbrake_key
  Airbrake.configure do |config|
    config.api_key = Rails.application.secrets.airbrake_key
  end
end
