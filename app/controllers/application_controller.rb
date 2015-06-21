class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  FLASH_MESSAGES = %i(notice success error alert)

  def show
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  def render(*args)
    set_flash_now(args.last)
    super(*args)
  end

  private

  def set_flash_now(options)
    return unless options
    return unless options.is_a?(Hash)
    options = HashWithIndifferentAccess.new(options)
    FLASH_MESSAGES.each do |msg|
      flash.now[msg] = options[msg] if options.key?(msg)
    end
  end
end
