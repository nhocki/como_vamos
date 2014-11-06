module LayoutHelper
  def nav_link(name, url, options = {})
    css_class = options.fetch(:class) { "" }
    css_class << "active" if current_page?(url)
    options[:class] = css_class
    link_to name, url, options
  end
end
