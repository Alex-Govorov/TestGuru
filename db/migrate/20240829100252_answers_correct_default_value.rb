class AnswersCorrectDefaultValue < ActiveRecord::Migration[7.2]
  def up
    change_column :answers, :correct, :boolean, default: false
  end

  def down
  end
end
