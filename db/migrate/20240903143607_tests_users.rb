class TestsUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :tests_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :test
    end
  end
end
