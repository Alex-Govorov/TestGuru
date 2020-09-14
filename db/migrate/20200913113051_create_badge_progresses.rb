class CreateBadgeProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_progresses do |t|
      t.references :user_test, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
