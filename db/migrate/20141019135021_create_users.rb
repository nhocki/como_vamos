class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :provider
      t.string :provider_uid
      t.string :slug

      t.timestamps
    end

    add_index :users, [ :provider, :provider_uid ], unique: true
    add_index :users, :slug, unique: true
  end
end
