class ChangeTitleToImageUrl < ActiveRecord::Migration
  def change
  	rename_column :gifs, :title, :image_url
  	
  end
end
