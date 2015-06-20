module ItemsHelper
  def item_icon_tag(item)
    icon_tag(item.to_icon_name || 'file')
  end
end
