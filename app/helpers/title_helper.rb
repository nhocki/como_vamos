module TitleHelper
  def page_title
    title = t(page_title_translation_key, page_title_context.merge(default: :"title.default"))
    title.concat t(:"title.suffix") if title != t(:"title.default")
    title
  end

  def page_title_translation_key
    :"title.#{controller_name}.#{action_name}"
  end

  def page_title_context
    controller.view_assigns.symbolize_keys
  end
end
