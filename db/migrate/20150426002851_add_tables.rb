class AddTables < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :repo_name
      t.string :repo_url
      t.string :website_url
      t.integer :user_id
      t.text :details
      t.boolean :solo_contributor, default: true, null: false
      t.boolean :visible, default: true, null: false
      t.boolean :private, default: true, null: false
    end

    add_index :projects, :user_id

    create_table :accounts do |t|
      t.string :slug
      t.string :url
      t.string :username
      t.string :access_token
      t.integer :user_id
    end

    add_index :accounts, :user_id
  end
end
