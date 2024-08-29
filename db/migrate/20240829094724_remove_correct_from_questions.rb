class RemoveCorrectFromQuestions < ActiveRecord::Migration[7.2]
  def change
    remove_column :questions, :correct
  end
end
