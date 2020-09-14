class AddCompletedToUserTests < ActiveRecord::Migration[6.0]
  def change
    add_column :user_tests, :completed, :boolean, default: false
  end
end
