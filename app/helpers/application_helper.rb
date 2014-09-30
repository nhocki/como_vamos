module ApplicationHelper
  def content_or_partial(content, partial = nil)
    partial ||= content
    content_for?(content) ? content_for(content) : render( content.to_s)
  end
end
