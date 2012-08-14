class RenameDescriptionToContent < ActiveRecord::Migration
  def up
    rename_column :posts, :description, :content
  end

  def down
  end
end
