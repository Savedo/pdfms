module ItemsHelper
  def item_icon_tag(item)
    icon_tag(item.to_icon_name || 'file')
  end

  def render_dressed_item_form(item, &block)
    render_show_breadcrumb(item) +
    build_form_title(item) +
    render_item_form(item, &block)
  end

  def render_item_form(item, &block)
    simple_form_for(item, build_item_form_options(item)) do |f|
      render_item_form_error_notofocations(f) +
        render_item_form_inputs(f, &block) +
        render_item_form_actions(item, f)
    end
  end

  private

  def build_form_title(item)
    content_tag(:h1, build_header_string(item), class: 'page-header')
  end

  def build_header_string(item)
    verb = item.persisted? ? 'Edditing' : 'New'
    item_icon_tag(item) + "#{ verb } #{ item.model_name.singular }".html_safe
  end

  def build_item_form_options(item)
    {
      url: build_item_form_url(item),
      remote: true
    }
  end

  def build_item_form_url(item)
    if item.persisted?
      helper_method = "#{ item.model_name.singular }_path"
      send(helper_method, item)
    else
      build_new_item_form_url(item)
    end
  end

  def build_new_item_form_url(item)
    if item.folder
      helper_method = "folder_#{ item.model_name.plural }_path"
      send(helper_method, item.folder)
    else
      helper_method = "new_#{ item.model_name.singular }_path"
      send(helper_method)
    end
  end

  def render_item_form_error_notofocations(f)
    f.error_notification || ''.html_safe
  end

  def render_item_form_inputs(f, &block)
    content_tag(:div, capture(f, &block), class: 'form-inputs')
  end

  def render_item_form_actions(item, f)
    content_tag(:div, class: 'form-actions') do
      f.button(:submit, class: %w(btn btn-primary)) + link_to('Cancel', item, class: 'btn btn-default', remote: true)
    end
  end
end
