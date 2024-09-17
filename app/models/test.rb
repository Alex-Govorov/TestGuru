class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy

  scope :level_easy, -> {  where(level: 0..1) }
  scope :level_normal, -> {  where(level: 2..4) }
  scope :level_hard, -> {  where("level >= ?", 5) }

  def self.by_category_title(title)
    self.joins("INNER JOIN categories ON categories.id = tests.category_id")
    .where(categories: { title: title }).order(title: :desc).pluck(:title)
  end
end
