class Badge < ApplicationRecord
  RULES = {
    category: 'Выполнить все тесты из категории',
    level: 'Выполнить все тесты уровня',
    attemp: 'Выполнить тест c первой попытки'
  }.freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy
  has_many :badge_progresses, dependent: :destroy
  has_many :user_tests, through: :badge_progresses, dependent: :destroy

  scope :ordered_by_id, -> { all.order(:id) }
  scope :count_by_id, ->(id) { where(id: id).count }

  validates :title, :image_path, :rule_name, :rule_value, presence: true
  validates :rule_name, uniqueness: { scope: :rule_value }

  def text_rule
    rule_description = RULES[rule_name.to_sym]
    id = rule_value.to_i

    case rule_name
    when 'category'
      text_name = Category.find(id).title
      "#{rule_description} #{text_name}"
    when 'attemp'
      text_name = Test.find(id).title
      rule_description.sub 'тест', "тест #{text_name}"
    when 'level'
      "#{rule_description} #{rule_value}"
    end
  end
end
