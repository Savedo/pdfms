module ApplicationHelper
  def icon_tag(icon_name)
    content_tag(:span, '', class: "glyphicon glyphicon-#{ icon_name }")
  end

  def render_js_string(*params)
    render(*params).to_json.html_safe
  end
end
