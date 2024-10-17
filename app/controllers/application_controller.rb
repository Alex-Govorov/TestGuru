class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protected
  def flash_message(type, message)
    (flash[type] || flash[type] = []) << message
  end

  def flash_errors(object)
    object.errors.full_messages.each { |error| flash_message(:error, error) }
  end
end
