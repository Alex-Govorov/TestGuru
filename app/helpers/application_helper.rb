module ApplicationHelper
  BOOTSTRAP_FLASH = { 'alert' => 'danger', 'notice' => 'info' }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    html = "<a href=\"https://github.com/#{author}/#{repo}\" target=\"_blank\">#{repo}</a>"
    html.html_safe
  end

  def flash_css_class(key)
    raise "Define bootstrap alert class for flash type: #{key}" unless BOOTSTRAP_FLASH[key]

    BOOTSTRAP_FLASH[key]
  end
end
