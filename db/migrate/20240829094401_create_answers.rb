class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct

      t.timestamps
    end
  end
end