class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :user_test, dependent: :destroy
  has_many :users, through: :user_test, dependent: :destroy
  has_many :questions, dependent: :destroy

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category_title, lambda { |title|
    joins(:category).where(categories: { title: title }).order(title: :desc)
  }

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.by_category_title(title)
    joins(:category).where(categories: { title: title }).pluck(:title)
  end
end
