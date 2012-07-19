class CreateUsers < ActiveRecord::Migration
has_many :posts

  def change
    create_table :users do |t|
	t.string :name, :null=>false
	t.string :email, :null=>false
      t.timestamps
    end
  end
end
