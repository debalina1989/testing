class CreatePosts < ActiveRecord::Migration


  def change
    create_table :posts do |t|
      t.string :user_id, :null=> false
      t.string :title, :null=> false
      t.string :description, :null=> false
      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
