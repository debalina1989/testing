class CreatePosts < ActiveRecord::Migration
belongs_to :user

  def change
    create_table :posts do |t|
	t.string :user_id, :null=> false
	t.string :title, :null=> false
	t.string :description, :null=> false
      t.timestamps
    end
	add_index :posts, :user_id
  end
end
