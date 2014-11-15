class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  mount_uploader :source_code, SolutionUploader

  validates :user, :problem, :explanation, :source_code, presence: true

  delegate :name, to: :user, prefix: true

  def highlight_lang
    SolutionUploader::EXTENSION_TO_LANG[file_extension]
  end

  def source_code_content
    if source_code.stored_on_s3?
      get_content_from_s3
    else
      File.read(source_code.file.path)
    end
  end

  private

  def get_content_from_s3
    # Download the source code from S3
    Rails.cache.fetch("#{cache_key}/source_content") do
      HTTParty.get(source_code_url).body
    end
  end

  def file_extension
    @file_extension ||= source_code.file.extension.to_sym
  end
end
