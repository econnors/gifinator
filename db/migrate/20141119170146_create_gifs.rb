class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
    	t.string :title
    	t.references :user

    	t.timestamps
    end
  end
end
