class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  validates :user, :problem, :explanation, :source_code, presence: true

  def highlight_lang
    SolutionUploader::EXTENSION_TO_LANG[file_extension]
  end

  private

  def file_extension
    @file_extension ||= source_code.file.extension.to_sym
  end
end
