class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.references :judge, index: true
      t.string :number, null: false
      t.string :title,  null: false
      t.string :url,    null: false
      t.string :slug
      t.references :creator

      t.timestamps
    end

    add_index :problems, :slug, unique: true
  end
end
