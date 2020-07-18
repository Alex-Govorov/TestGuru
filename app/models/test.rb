class Test < ApplicationRecord
  has_many :user_test
  has_many :users, through: :user_test

  def self.by_category_title(category_title)
    # Тут скорее более красиво можно сделать через ассоциации, но в учебных целях
    # решил освоить joins через SQL запрос
    sql = 'INNER JOIN categories ON tests.category_id = categories.id'
    joins(sql).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
  end
end
