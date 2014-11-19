module ApplicationHelper
  def localized_key(key)
    "#{I18n.locale}/#{key}"
  end

  def content_or_partial(content, partial = nil)
    partial ||= content
    content_for?(content) ? content_for(content) : render( content.to_s)
  end

  def login_path(provider = :github)
    "/auth/#{provider}"
  end

  def sidebar_categories
    @sidebar_categories ||= Category.order('name')
  end
end
