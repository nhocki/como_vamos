module ApplicationHelper
  def localized_key(key)
    "#{I18n.locale}/#{key}".freeze
  end

  def content_or_partial(content, partial = nil)
    partial ||= content
    content_for?(content) ? content_for(content) : render(content.to_s)
  end

  def login_path(provider = :github)
    "/auth/#{provider}".freeze
  end

  def sidebar_categories
    @sidebar_categories ||= Category.all
  end
end
