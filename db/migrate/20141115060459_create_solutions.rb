class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.references :user, index: true
      t.references :problem, index: true
      t.text :explanation, null: false
      t.string :source_code, null: false

      t.timestamps
    end
  end
end
