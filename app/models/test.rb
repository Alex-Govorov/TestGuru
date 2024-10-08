class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy

  scope :level_easy, -> {  by_level(0..1) }
  scope :level_normal, -> {  by_level(0..1) }
  scope :level_hard, -> {  by_level(5..Float::INFINITY) }
  scope :by_category_title, ->(title) { joins(:category).where(categories: { title: title }).order(title: :desc).pluck(:title) }
  scope :by_level, ->(level) { where(level: level) }

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level,
                                  message: "already taken for this level" }
  validates :level, numericality: { only_integer: true, greater_than: 0 }
end
