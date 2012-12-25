module ApplicationHelper
  def avatar_image(email, options=nil)
    options ||= {gravatar: {size: 48, default: "mm"}, class: "img-rounded"}
    gravatar_image_tag(email, options)
  end

  def nav_link(active_on, &block)
    active = controller_name == active_on ? "active" : ""
    content_tag :li, class: active, &block
  end

  def formatted_body(body)
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::AutolinkFilter
    ]
    pipeline.call(body)[:output].html_safe
  end
end
