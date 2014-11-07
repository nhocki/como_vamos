module LayoutHelper
  def nav_link(name, url, options = {})
    css_class = options.fetch(:class) { "" }
    css_class << "active" if current_page?(url)
    options[:class] = css_class
    link_to name, url, options
  end

  def sample_source_code
    File.read(Rails.root.join("CD_sample.cpp"))
  end

  def avatar_for(user, size: 96)
    image = image_tag(user.avatar(size: size), alt: user.name)
    content_tag :div, image, class: 'avatar'
  end
end