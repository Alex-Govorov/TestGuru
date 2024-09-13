class User < ApplicationRecord
  has_many :tests_published, class_name: "Test", foreign_key: "author_id"
  has_and_belongs_to_many :tests

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
