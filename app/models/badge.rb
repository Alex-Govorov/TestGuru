class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy
  has_many :badge_progresses, dependent: :destroy
  has_many :user_tests, through: :badge_progresses, dependent: :destroy

  scope :ordered_by_id, -> { all.order(:id) }
  scope :count_by_id, ->(id) { where(id: id).count }

  validates :title, :image_path, :rule_name, :rule_value, presence: true
  validate :rule_name_included_in_service
  validates :rule_name, uniqueness: { scope: :rule_value }

  def rule_name_included_in_service
    errors.add(:rule_name, :invalid) unless BadgeService::RULES.include?(rule_name.to_sym)
  end
end
