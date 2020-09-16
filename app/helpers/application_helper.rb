module ApplicationHelper
  BOOTSTRAP_FLASH = { 'alert' => 'danger', 'notice' => 'info' }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    html = "<a href=\"https://github.com/#{author}/#{repo}\" target=\"_blank\">#{repo}</a>"
    html.html_safe
  end

  def gist_link(id, text)
    "<a href=\"https://gist.github.com/#{id}\" target=\"_blank\">#{text}</a>".html_safe
  end

  def flash_css_class(key)
    raise "Define bootstrap alert class for flash type: #{key}" unless BOOTSTRAP_FLASH[key]

    BOOTSTRAP_FLASH[key]
  end

  def render_badges
    @badges = Badge.ordered_by_id
    render template: 'badges/index'
  end

  def badge_text_rule(badge)
    value = badge.rule_value

    case badge.rule_name
    when 'category'
      category = Category.find(value).title
      I18n.t(:rule_category, value: category)
    when 'attemp'
      test_title = Test.find(value).title
      I18n.t(:rule_attemp, value: test_title)
    when 'level'
      I18n.t(:rule_level, value: value)
    end
  end
end
