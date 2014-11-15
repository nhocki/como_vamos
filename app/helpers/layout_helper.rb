module LayoutHelper
  def nav_link(name, url, options = {})
    css_class = options.fetch(:class) { "" }
    css_class << "active" if current_page?(url)
    options[:class] = css_class
    link_to name, url, options
  end

  def formatted_date(date, format = "%B %-d, %Y")
    date.strftime(format)
  end

  # No op. for now.
  def markdown(text)
    text
  end

  def solution_source(solution)
    content_tag :code, data: {language: solution.highlight_lang} do
      solution.source_code_content
    end
  end

  def sample_source_code
    File.read(Rails.root.join("CD_sample.cpp"))
  end

  def avatar_for(user, size: 96)
    image = image_tag(user.avatar(size: size), alt: user.name)
    content_tag :div, image, class: 'avatar'
  end

  def chosen_options
    {
      class: 'chosen-select',
    }
  end

  def category_badge(category)
    content_tag :span, class: 'category success' do
      link_to category.name, category
    end
  end
end
