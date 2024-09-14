class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :body, null: false

      t.timestamps
      t.references :test, foreign_key: { to_table: :tests }
    end
  end
end
