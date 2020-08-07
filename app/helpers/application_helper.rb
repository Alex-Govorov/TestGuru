module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    html = "<a href=\"https://github.com/#{author}/#{repo}\" target=\"_blank\">#{repo}</a>"
    html.html_safe
  end
end
