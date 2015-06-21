module ShowHelper
  def render_show_header(item)
    render_show_breadcrumb(item) + render_show_title(item) + render_tags(item)
  end

  def render_show_breadcrumb(item)
    breadcrumb = build_breadcrumb_array(item)
    render_breadcrumb_array(breadcrumb)
  end

  def render_show_title(item)
    content_tag(:h1, class: 'page-header') do
      item_icon_tag(item) + item.name +
      (item.try(:slug) ? content_tag(:span, "/#{ item.slug }", class: 'slug') : '') +
      render_edit_button(item) + render_delete_button(item)
    end
  end

  def render_tags(item)
    return '' unless item.try(:tags)
    content_tag(:p, class: 'tags') do
      'Tags: '.html_safe + item.tags.split(' ').map { |t| content_tag(:span, t, class: 'tag btn btn-default btn-xs') }.join.html_safe
    end
  end

  def render_edit_button(item)
    path_helper = "edit_#{ item.model_name.singular }_path"
    link_to('Edit', send(path_helper, item), class: 'btn btn-warning', remote: true)
  end

  def render_delete_button(item)
    link_to('Delete', item, class: 'btn btn-danger', method: :delete, data: { confirm: 'Are you sure?'}, remote: true)
  end

  private

  def render_breadcrumb_array(breadcrumb)
    content_tag(:ol, class: 'breadcrumb') do
      content_tag(:li, link_to('Root', root_path, remote: true)) +
        breadcrumb.map { |item| content_tag(:li, link_to(item.name, item, remote: true)) }.join.html_safe
    end
  end

  def build_breadcrumb_array(item)
    folders = []
    current = item.folder
    while current do
      folders << current
      current = current.folder
    end
    folders.reverse
  end
end
