class CreateTests < ActiveRecord::Migration[7.2]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0

      t.timestamps
      t.belongs_to :category, foreign_key: true
      t.belongs_to :author, foreign_key: { to_table: :users }
    end
  end
end
