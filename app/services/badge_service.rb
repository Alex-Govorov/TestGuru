class BadgeService
  RULES = %i[category level attemp].freeze

  def initialize(user_test)
    @user_test = user_test
  end

  def calculate
    return unless @user_test.successfully

    @rewards = []
    Badge.select { |badge| send "#{badge.rule_name}_calc".to_sym, badge }
    @rewards.empty? ? nil : @rewards
  end

  private

  def category_calc(badge)
    category = Category.find(badge.rule_value)
    return unless @user_test.test.category == category

    tests_in_category = category.tests.order(:id)
    nominated_user_tests = user_tests_without_progress(badge).where(test_id: category.tests)

    return unless tests_in_category.pluck(:id) == nominated_user_tests.pluck(:test_id).sort.uniq

    nominated_user_tests.each { |user_test| save_badge_progress(user_test, badge) }
    reward_user_with_badge(@user_test.user, badge)
  end

  def attemp_calc(badge)
    test = Test.find(badge.rule_value)
    return unless @user_test.test == test
    return unless UserTest.where(user: @user_test.user, test: test).count == 1

    save_badge_progress(@user_test, badge)
    reward_user_with_badge(@user_test.user, badge)
  end

  def level_calc(badge)
    level = badge.rule_value.to_i
    return unless @user_test.test.level == level

    tests_with_level = Test.by_level(level).order(:id)
    nominated_user_tests = user_tests_without_progress(badge).where(test_id: Test.by_level(level))

    return unless tests_with_level.pluck(:id) == nominated_user_tests.pluck(:test_id).sort.uniq

    nominated_user_tests.each { |user_test| save_badge_progress(user_test, badge) }
    reward_user_with_badge(@user_test.user, badge)
  end

  def reward_user_with_badge(user, badge)
    user.badges.push(badge)
    @rewards << badge
  end

  def save_badge_progress(user_test, badge)
    user_test.badges.push(badge)
  end

  def user_tests_without_progress(badge)
    UserTest
      .where.not(id: BadgeProgress.select(:user_test_id)
      .where(badge_progresses: { badge_id: badge }))
      .where(user_id: @user_test.user, successfully: true)
  end
end
