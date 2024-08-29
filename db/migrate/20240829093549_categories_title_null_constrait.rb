class CategoriesTitleNullConstrait < ActiveRecord::Migration[7.2]
  def up
    change_column_null(:categories, :title, false)
  end

  def down
    change_column_null(:categories, :title, true)
  end
end
