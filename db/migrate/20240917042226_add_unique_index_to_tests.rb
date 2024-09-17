class AddUniqueIndexToTests < ActiveRecord::Migration[7.2]
  def change
    add_index :tests, [ :title, :level ], unique: true
  end
end
