module LayoutHelper
  def body_class
    "#{controller_name}_controller #{action_name}_action"
  end

  def content_class
    full_layout? ? 'full' : 'with-sidebar'
  end

  def nav_link(name, url, options = {})
    css_class = options.fetch(:class) { "" }
    css_class << "active" if current_page?(url)
    options[:class] = css_class
    link_to name, url, options
  end

  def formatted_date(date, format = "%B %-d, %Y")
    date.strftime(format)
  end

  def solution_source(solution)
    content_tag :code, data: {language: solution.highlight_lang} do
      solution.source_code_content
    end
  end

  def avatar_for(user, size: 96)
    image = image_tag(user.avatar(size: size), alt: user.display_name)
    content_tag :div, image, class: 'avatar'
  end

  def chosen_options(extra = {})
    {
      class: 'chosen-select',
    }.merge(extra.except(:class))
  end

  def category_badge(category)
    content_tag :span, class: 'category success' do
      link_to category.name, category
    end
  end
end
