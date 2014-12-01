# encoding: utf-8

class SolutionUploader < CarrierWave::Uploader::Base
  EXTENSION_TO_LANG = {
    c:    'c',
    cc:   'c',
    go:   'go',
    rb:   'ruby',
    py:   'python',
    hs:   'haskell',
    js:   'javascript',
    cpp:  'c',
    pas:  'pascal',
    java: 'java',
  }.freeze

  def self.allowed_extensions
    EXTENSION_TO_LANG.keys.map(&:to_s)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    @extension ||= self.class.allowed_extensions
  end

  def stored_on_s3?
    storage.is_a?(CarrierWave::Storage::Fog)
  end
end
