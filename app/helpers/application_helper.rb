module ApplicationHelper
  def icon_tag(icon_name)
    content_tag(:i, '', class: "fas fa-#{icon_name}")
  end
end
