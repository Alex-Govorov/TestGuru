class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy
  has_many :badge_progresses, dependent: :destroy
  has_many :user_tests, through: :badge_progresses, dependent: :destroy

  scope :ordered_by_id, -> { all.order(:id) }
  scope :count_by_id, ->(id) { where(id: id).count }

  validates :title, :image_path, :rule_name, :rule_value, presence: true
  validates :rule_name, inclusion: { in: BadgeService::RULES.map(&:to_s) }
  validates :rule_name, uniqueness: { scope: :rule_value }
end
