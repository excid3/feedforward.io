module ApplicationHelper
  def nav_link(active_on, &block)
    active = controller_name == active_on ? "active" : ""
    content_tag :li, class: active, &block
  end
end
