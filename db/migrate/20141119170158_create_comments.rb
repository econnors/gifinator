class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :comment
    	t.references :user
    	t.references :gif

    	t.timestamps
    end
  end
end
