require 'segment/analytics'

if Rails.application.secrets.segment_key
  Analytics = Segment::Analytics.new(
    write_key: Rails.application.secrets.segment_key,
    on_error: Proc.new { |status, msg| Rails.logger.info{"[#{status}] #{msg}" }}
  )
end
