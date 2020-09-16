class RenameCompletedToSuccessfullyInUserTests < ActiveRecord::Migration[6.0]
  def up
    rename_column :user_tests, :completed, :successfully
  end

  def down
    rename_column :user_tests, :successfully, :completed
  end
end
