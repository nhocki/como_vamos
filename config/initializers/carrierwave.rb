if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider:               'AWS'.freeze,
      aws_access_key_id:      Rails.application.secrets.aws_access,
      aws_secret_access_key:  Rails.application.secrets.aws_secret,
    }
    config.fog_directory  = Rails.application.secrets.aws_bucket
  end
end
