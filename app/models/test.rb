class Test < ApplicationRecord
  has_and_belongs_to_many :users

  def self.by_category_title(title)
    self.joins("INNER JOIN categories ON categories.id = tests.category_id")
    .where(categories: { title: title }).order(title: :desc).pluck(:title)
  end
end
