class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :username
      t.text :body
      t.integer :post_id
      t.timestamps null: false
    end
  end
end
