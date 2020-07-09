class RemoveCategoriesFromTests < ActiveRecord::Migration[6.0]
  def change
    remove_column :tests, :category_id, :integer
  end
end
