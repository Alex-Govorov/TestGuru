module SessionsHelper
  def flash_message(tag, type)
    content_tag tag, flash[type], class: "flash #{type}" if flash[type]
  end
end
