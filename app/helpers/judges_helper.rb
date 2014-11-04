module JudgesHelper
  def website_link_for(judge, options = {})
    options = {
      title: t('.go_to_website', name: judge.name),
      target: '_blank',
    }.merge(options)

    link_to judge.url, options do
      icon 'globe', t('.website')
    end
  end
end
