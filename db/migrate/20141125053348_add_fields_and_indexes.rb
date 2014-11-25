class AddFieldsAndIndexes < ActiveRecord::Migration
  def change
    # problems many-to-many categories
    add_column :problems, :categories_count, :integer, default: 0, null: false
    add_column :categories, :problems_count, :integer, default: 0, null: false

    add_column :users,    :solutions_count, :integer, default: 0, null: false
    add_column :problems, :solutions_count, :integer, default: 0, null: false

    # Default category order.
    add_index :categories, :name, unique: true

    # Problem ordering
    # * By number when looking at a Judge
    # * By created_at in other places.
    add_index :problems, [:judge_id, :number], unique: true
    add_index :problems, :created_at

    add_index :solutions, :created_at
  end
end
