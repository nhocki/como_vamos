CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      provider:               'AWS'.freeze,
      aws_access_key_id:      Rails.application.secrets.aws_access,
      aws_secret_access_key:  Rails.application.secrets.aws_secret,
    }
    config.fog_directory  = Rails.application.secrets.aws_bucket
  end

  elsif Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  end
end
