class AddDifficultyLevelToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :difficulty_level, :integer, default: 0, null: false
  end
end
