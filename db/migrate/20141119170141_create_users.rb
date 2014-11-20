class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.text :bio
    	t.references :profile_picture
    	t.string :password_digest

    	t.timestamps
    end
  end
end
