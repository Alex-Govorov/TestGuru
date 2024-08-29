class TestsLevelDefaultValue < ActiveRecord::Migration[7.2]
  def up
    change_column :tests, :level, :integer, default: 0
  end

  def down
  end
end
