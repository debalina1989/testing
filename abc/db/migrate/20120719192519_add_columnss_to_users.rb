class AddColumnssToUsers < ActiveRecord::Migration
  def change
	add_column :users, :firstname, :string
	add_column :users, :lastname, :string
	add_column :users, :fullname, :string
	add_column :users, :contact, :integer
	add_column :users, :user_type, :integer, :limit=> 4
  end
end
