class AddNameToProfilePicture < ActiveRecord::Migration
  def change
  	add_column :profile_pictures, :name, :string
  end
end

