class BadgeCalculator
  include ActiveModel::Model
  attr_accessor :user_test

  validates :user_test, presence: true

  def calculate
    return unless valid? && @user_test.completed

    @rewards = []
    Badge.find_each { |badge| send "#{badge.rule_name}_calc".to_sym, badge.rule_value.to_i, badge }
    @rewards.empty? ? nil : @rewards
  end

  private

  def category_calc(category_id, badge)
    return unless @user_test.test.category.id == category_id

    tests_in_category = Category.find(category_id).tests.order(:id)
    # ЮзерТесты которые не входят в таблицу badge_progresses c бадж id: текущий,
    # где юзер id: текущий, completed: true, где категория тестов - текущая
    nominated_user_tests = UserTest\
                           .where.not(id: BadgeProgress.select(:user_test_id)\
                           .where(badge_progresses: { badge_id: badge }))\
                           .where(user_id: @user_test.user, completed: true)\
                           .where(test_id: Category.find(category_id).tests)

    return unless tests_in_category.pluck(:id) == nominated_user_tests.pluck(:test_id).sort.uniq

    nominated_user_tests.each { |user_test| save_badge_progress(user_test, badge) }
    reward_user_with_badge(@user_test.user, badge)
  end

  def attemp_calc(test_id, badge)
    return unless @user_test.test.id == test_id
    return unless UserTest.where(user: @user_test.user, test: test_id).count == 1

    save_badge_progress(@user_test, badge)
    reward_user_with_badge(@user_test.user, badge)
  end

  def level_calc(level, badge)
    return unless @user_test.test.level == level

    tests_with_level = Test.by_level(level).order(:id)
    nominated_user_tests = UserTest\
                           .where.not(id: BadgeProgress.select(:user_test_id)\
                           .where(badge_progresses: { badge_id: badge }))\
                           .where(user_id: @user_test.user, completed: true)\
                           .where(test_id: Test.by_level(level))

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
end
