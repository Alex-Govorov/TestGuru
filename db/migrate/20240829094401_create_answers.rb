class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, null: false, default: false

      t.timestamps
      t.references :question, foreign_key: { to_table: :questions }
    end
  end
end
