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

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    @extension ||= EXTENSION_TO_LANG.keys.map(&:to_s)
  end
end
