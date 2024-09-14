class CreateTests < ActiveRecord::Migration[7.2]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0

      t.timestamps
      t.references :category, foreign_key: { to_table: :categories }
    end
  end
end
