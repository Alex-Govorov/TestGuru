class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :user_test, dependent: :destroy
  has_many :users, through: :user_test, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.by_category_title(category_title)
    joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
  end
end
