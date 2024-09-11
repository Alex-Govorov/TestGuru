class TestsUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :tests_users do |t|
      t.belongs_to :user, foreign_key: { to_table: :users }
      t.belongs_to :test, foreign_key: { to_table: :tests }
    end
  end
end
