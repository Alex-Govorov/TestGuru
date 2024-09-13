class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :body, null: false

      t.timestamps
      t.belongs_to :test, foreign_key: true
    end
  end
end
