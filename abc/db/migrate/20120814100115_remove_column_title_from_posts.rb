class RemoveColumnTitleFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :title
  end

  def down
  end
end
