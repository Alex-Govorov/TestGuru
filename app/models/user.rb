class User < ApplicationRecord
  has_many :tests_published, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_and_belongs_to_many :tests, dependent: :destroy

  def tests_by_level(level)
    self.tests.by_level(level)
  end
end
