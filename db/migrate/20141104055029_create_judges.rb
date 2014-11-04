class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.string :name
      t.string :url
      t.string :slug
      t.integer :problems_count

      t.timestamps
    end
    add_index :judges, :name, unique: true
    add_index :judges, :slug, unique: true
  end
end
