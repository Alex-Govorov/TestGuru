class AddQuestionToUserTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_tests, :current_question, null: true, foreign_key: { to_table: :questions }
  end
end
