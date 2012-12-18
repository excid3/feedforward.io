module ApplicationHelper
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
