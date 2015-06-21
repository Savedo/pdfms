module FlashHelper
  MAP_FLASH_CLASS = HashWithIndifferentAccess.new(
    notice: 'info',
    success: 'success',
    error: 'warning',
    alert: 'danger'
  ).to_hash.freeze

  def render_flash
    flash.map do |key, value|
      content_tag(:p, value, class: %W(alert alert-#{ MAP_FLASH_CLASS[key] || key.to_s }))
    end.join.html_safe
  end
end
