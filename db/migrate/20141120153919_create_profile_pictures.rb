class CreateProfilePictures < ActiveRecord::Migration
  def change
    create_table :profile_pictures do |t|
    	t.text :image_url

    	t.timestamps
    end
  end
end
